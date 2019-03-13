# longest-substring-without-repeating-characters

[https://leetcode.com/problems/longest-substring-without-repeating-characters/](https://leetcode.com/problems/longest-substring-without-repeating-characters/)

# thinking

1. 最开始是想通过两个指针，然后往下走，不过时间复杂度很大，所以就放弃了

2. 后来也是想通过两个指针，其实就是下标，然后通过一个map记录字符最新出现的位置，然后保留最大值就好了

```
func lengthOfLongestSubstring(s string) int {
    var m = make(map[uint8]int)
	var length, i, j = len(s), 0, 0
	var res = 0
	for i < length {
		if v, ok := m[s[i]]; ok {
			if i-j > res {
				res = i - j
			}
			// 如果没有这个判断,j的位置会跳，比如 "abba" 这种情况，j 的目标就是要一直往前走才对
			if v+1 > j {
				j = v + 1
			}
			m[s[i]] = i
			i++
			continue
		}
		m[s[i]] = i // 记录最新的字符对应的位置
		i++
	}

	if i-j > res {
		return i - j
	}

	return res
}
```
