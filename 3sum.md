# 3 sum

[https://leetcode.com/problems/3sum-closest/](https://leetcode.com/problems/3sum-closest/)

# My Solution

```
 /**
* @param Integer[] $nums
* @param Integer $target
* @return Integer
*/
function threeSumClosest($nums, $target) {
	if (empty($nums)) {
	    return 0;
	}
	sort($nums);
	$length = count($nums);
		$min = PHP_INT_MAX;
		$sign = true;
		for ($i = 0; $i < $length; $i ++) {
			for ($j = $i + 1; $j < $length; $j ++) {
				for ($k = $j + 1; $k < $length; $k ++) {
					$range = $target - $nums[$i] - $nums[$j] - $nums[$k];
					if (abs($range) < $min){
						if ($range < 0)
						{
							$min = -$range;
							$sign = true;
						}else{
							$min = $range;
							$sign = false;
						}
					}
				}
			}
	}
	if ($sign) {
		return $target + $min;
	}else {
		return $target - $min;
	}
}
// O(n^3)
```

# My Thinking

最开始是希望通过 two pointer 的思路去解决这个问题，但是实现起来不够理想，所以放弃了，上面的解决方案应该算是最 low 的了~

后来又觉得其实是可以通过 two pointer 的方式取解决，所以画了个图，理论上可以，于是有了下面最新的答案

# TWO Pointer O(nLogn)

```
function threeSumClosest($nums, $target) {
	if (empty($nums)) {
	    return 0;
	}
	sort($nums);
	$length = count($nums);
	$closest = $nums[0] + $nums[1] + $nums[2];
	for ($i = 0; $i < $length; $i ++) {
	    $low  = $i + 1;
	    $high = $length - 1;
	    while ($low < $high) {
		if ($nums[$i] + $nums[$low] + $nums[$high] == $target) {
		    return $target;
		} else if ($nums[$i] + $nums[$low] + $nums[$high] < $target) {
		    $closest = ($target - ($nums[$i] + $nums[$low] + $nums[$high])) < abs($closest - $target) ? $nums[$i] + $nums[$low] + $nums[$high] : $closest;
		    $low++;
		} else {
		    $closest = (($nums[$i] + $nums[$low] + $nums[$high]) - $target) < abs($closest - $target) ? $nums[$i] + $nums[$low] + $nums[$high] : $closest;
		    $high--;
		}
	    }
	}
	return $closest;
}
```

