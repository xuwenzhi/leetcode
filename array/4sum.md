# 4 num

[https://leetcode.com/problems/4sum/](https://leetcode.com/problems/4sum/)

## 核心原理

1. 二分 two pointer
2. 尽可能减少循环次数

## PHP Solution

```
function fourSum($nums, $target) {
    sort($nums);
    $i = 0;
    $num_length = count($nums);
    $result = [];

    for ($i = 0; $i < $num_length; $i ++) {
        for ($j = $i + 1; $j < $num_length; $j ++) {
            $low = $j + 1;
            $high = $num_length - 1;
            while ($low < $high) {
                $gap = $target - $nums[$i] - $nums[$j] - $nums[$low] - $nums[$high];
                if ($gap == 0) {

                    if (is_integer($nums[$i]) &&
                        is_integer($nums[$j]) &&
                        is_integer($nums[$low]) &&
                        is_integer($nums[$high]))
                    $result[] = [
                        $nums[$i],
                        $nums[$j],
                        $nums[$low],
                        $nums[$high],
                    ];
                    $low ++;
                    $high --;
                } elseif ($gap > 0) {
                    $low += 1;
                } else {
                    $high -= 1;
                }
            }
        }
    }

    return array_unique($result, SORT_REGULAR);
}
```