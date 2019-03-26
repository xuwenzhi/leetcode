# letter-combinations-of-a-phone-number

[https://leetcode.com/problems/letter-combinations-of-a-phone-number/](https://leetcode.com/problems/letter-combinations-of-a-phone-number/)

```
Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.

A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

![http://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Telephone-keypad2.svg/200px-Telephone-keypad2.svg.png](http://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Telephone-keypad2.svg/200px-Telephone-keypad2.svg.png)

Example:

Input: "23"
Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
Note:

Although the above answer is in lexicographical order, your answer could be in any order you want.
```

# thinking

既然是2-9，并且每个数字所拥有的字母都不同，肯定要维护一个map。使用递归依次处理当前第一个字符即可了.

# solution

```
class Solution {
public:
    vector<string> letterCombinations(string digits) {
        vector<string> res;
        if (digits.empty()) return res;
        combine(digits, res);
        return res;
    }

    vector<string> letters(int index) {
        vector<vector<string>> vec{
            {"a", "b", "c"},
            {"d","e","f"},
            {"g","h", "i"},
            {"j","k", "l"},
            {"m","n", "o"},
            {"p","q", "r", "s"},
            {"t","u", "v"},
            {"w","x", "y", "z"}
        };

        return vec[index-2];
    }

    void combine(string s, vector<string> &res) {
        if (s.size() == 0) return;
		// use for current call.
        vector<string> tmp_res;
        int crt_alpha = atoi(s.substr(0, 1).c_str());
        vector<string> letter = letters(crt_alpha);
		// first handle
        if (res.size() == 0) {
            for (int i = 0; i < letter.size(); i++) {
                res.push_back(letter[i]);
            }
        } else {
            for (int j=0;j<res.size();j++) {
                for (int i = 0; i < letter.size(); i++) {
                    tmp_res.push_back(res[j] + letter[i]);
                }
            }
            res.clear(); // previous res is not useful.
            res = tmp_res;
        }

        if (s.size() == 1) return ;
        combine(s.substr(1), res);
    }
};
```

Success

Details

Runtime: 4 ms, faster than 100.00% of C++ online submissions for Letter Combinations of a Phone Number.

Memory Usage: 9.3 MB, less than 7.00% of C++ online submissions for Letter Combinations of a Phone Number.
