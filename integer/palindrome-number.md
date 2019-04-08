# palindrome-number

[https://leetcode.com/problems/palindrome-number/](https://leetcode.com/problems/palindrome-number/)

# thinking

1. 把数字的每一位添加到一个数组中，然后依次比较首尾即可了.


# solution

```
func isPalindrome(x int) bool {
    if x < 0 {
        return false;
    }
	var a [10]int
	var i, j = 0, 0
	for x > 0 {
		a[i] = x % 10
		i++
		x /= 10
	}
	for ; j < i/2; j++ {
		if a[j] != a[i-j-1] {
			return false
		}
	}

	return true
}
```
