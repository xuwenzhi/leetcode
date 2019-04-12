# valid-palindrome

[https://leetcode.com/problems/valid-palindrome/](https://leetcode.com/problems/valid-palindrome/)

```
Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

Note: For the purpose of this problem, we define empty string as valid palindrome.

Example 1:

Input: "A man, a plan, a canal: Panama"
Output: true
Example 2:

Input: "race a car"
Output: false
```

# thinking

今儿个生病了，刷道题前面好几个wrong，啊，刷得更加难受了。

不过这道题还是很简单的，只需要考虑几个细节点就好了，比如说合法字符是字母（包含大小写)或者数字，两个字符是否相等即可了，所以实现上也采用了两个函数用于判断。

# solution

```c++
// O(n) Runtime O(1) Space
class Solution {
public:
    bool isEqual(char c1, char c2) {
        if (c1 == c2) return true;
        if (tolower(c1) == tolower(c2))
            return true;

        return false;
    }

    bool isValid(char c) {
        return isalpha(c) || isalnum(c);
    }

    bool isPalindrome(string s) {
        int len = s.size();
        int low = 0, high = len-1;
        while (low < high) {
            while (!isValid(s[low]) && low < high) low++;
            while (!isValid(s[high]) && high >= low) high--;

            if (low >= high) break;
            if (!isEqual(s[low], s[high])) return false;
            low++;
            high--;
        }

        return true;
    }
};
```

Runtime: 12 ms, faster than 77.17% of C++ online submissions for Valid Palindrome.

Memory Usage: 9.4 MB, less than 17.49% of C++ online submissions for Valid Palindrome.
