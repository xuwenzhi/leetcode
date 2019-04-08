# 3sum-closest

[https://leetcode.com/problems/3sum-closest/](https://leetcode.com/problems/3sum-closest/)

O(nlogn)

```php
class Solution {

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
}
```
