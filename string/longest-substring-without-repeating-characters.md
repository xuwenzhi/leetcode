# longest-substring-without-repeating-characters

[https://leetcode.com/problems/longest-substring-without-repeating-characters/](https://leetcode.com/problems/longest-substring-without-repeating-characters/)

# thinking

1. 最开始是想通过两个指针，然后往下走，不过时间复杂度很大，所以就放弃了

2. 后来也是想通过两个指针，其实就是下标，然后通过一个map记录字符最新出现的位置，然后保留最大值就好了

# solution (golang)

```golang
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


# solution (c++ 2020.3.11, sliding window)

```c++
class Solution {
public:
    bool isRepeat(unordered_map<char,int>& m) {
        for (auto i : m) {
            if (i.second > 1) return true;
        }

        return false;
    }

    int lengthOfLongestSubstring(string s) {
        int i = 0, j = 0, l = s.length(), res = 1;
        if (l == 0) return 0;
        unordered_map<char, int> m;
        while (j < l) {
            m[s[j]]++;
            while (isRepeat(m) && i <= j) {
                m[s[i]]--;
                i++;
            }
            res = max(res, j - i + 1);
            j++;
        }

        return res;
    }
};
//Runtime: 28 ms, faster than 42.77% of C++ online submissions for Longest Substring Without Repeating Characters.
//Memory Usage: 10.2 MB, less than 73.13% of C++ online submissions for Longest Substring Without Repeating Characters.
```

# solution (best 2020.7.4)

```c++
class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        vector<int> m(256, -1);
        int res = 0, start = -1;
        for (int i=0;i<s.length();i++) {
            if (m[s[i]] > start) {
                start = m[s[i]];
            }
            m[s[i]] = i;
            res = max(res, i - start);
        }

        return res;
    }
};
//Runtime: 8 ms, faster than 98.70% of C++ online submissions for Longest Substring Without Repeating Characters.
//Memory Usage: 8.5 MB, less than 64.68% of C++ online submissions for Longest Substring Without Repeating Characters.
```
