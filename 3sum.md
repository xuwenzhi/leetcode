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
```

# My Thinking

Firstly, I want to solve this by two pointer like 3sum and 4sum, But the closest 3sum isn't simple. Previous I can compare by zero.

So I give above solution, Although, I understand it's low.

#

