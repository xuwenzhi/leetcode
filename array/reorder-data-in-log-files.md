# reorder-data-in-log-files

[https://leetcode.com/problems/reorder-data-in-log-files/](https://leetcode.com/problems/reorder-data-in-log-files/)

```
You have an array of logs.  Each log is a space delimited string of words.

For each log, the first word in each log is an alphanumeric identifier.  Then, either:

Each word after the identifier will consist only of lowercase letters, or;
Each word after the identifier will consist only of digits.
We will call these two varieties of logs letter-logs and digit-logs.  It is guaranteed that each log has at least one word after its identifier.

Reorder the logs so that all of the letter-logs come before any digit-log.  The letter-logs are ordered lexicographically ignoring identifier, with the identifier used in case of ties.  The digit-logs should be put in their original order.

Return the final order of the logs.



 Example 1:

 Input: logs = ["dig1 8 1 5 1","let1 art can","dig2 3 6","let2 own kit dig","let3 art zero"]
 Output: ["let1 art can","let3 art zero","let2 own kit dig","dig1 8 1 5 1","dig2 3 6"]


  Constraints:

  0 <= logs.length <= 100
  3 <= logs[i].length <= 100
  logs[i] is guaranteed to have an identifier, and a word after the identifier.You have an array of logs.  Each log is a space delimited string of words.

  For each log, the first word in each log is an alphanumeric identifier.  Then, either:

  Each word after the identifier will consist only of lowercase letters, or;
  Each word after the identifier will consist only of digits.
  We will call these two varieties of logs letter-logs and digit-logs.  It is guaranteed that each log has at least one word after its identifier.

  Reorder the logs so that all of the letter-logs come before any digit-log.  The letter-logs are ordered lexicographically ignoring identifier, with the identifier used in case of ties.  The digit-logs should be put in their original order.

  Return the final order of the logs.



   Example 1:

   Input: logs = ["dig1 8 1 5 1","let1 art can","dig2 3 6","let2 own kit dig","let3 art zero"]
   Output: ["let1 art can","let3 art zero","let2 own kit dig","dig1 8 1 5 1","dig2 3 6"]


	Constraints:

	0 <= logs.length <= 100
	3 <= logs[i].length <= 100
	logs[i] is guaranteed to have an identifier, and a word after the identifier.
```

# thinking

最开始以为是只需要对一行日志后面的部分排序就好了，结果提交之后是有问题，如果后面一部分一样还得根据前缀排序，那在C++里只需要复写一个比较匿名函数即可搞定了。

```
auto comp = [](const string s1, const string s2) {
            int blank_pos1 = s1.find_first_of(' '), blank_pos2 = s2.find_first_of(' ');
            return s1.substr(blank_pos1+1) < s2.substr(blank_pos2+1)
                || (s1.substr(blank_pos1+1) == s2.substr(blank_pos2+1)
                    && s1.substr(0, blank_pos1) < s2.substr(0, blank_pos2));
        };
```

```c++
class Solution {
public:
    vector<string> reorderLogFiles(vector<string>& logs) {
        vector<string> digits, letter;
        for (auto s : logs) {
            if (isdigit(s[s.find_first_of(' ')+1])) {
                digits.push_back(s);
            } else {
                letter.push_back(s);
            }
        }
        auto comp = [](const string s1, const string s2) {
            int blank_pos1 = s1.find_first_of(' '), blank_pos2 = s2.find_first_of(' ');
            return s1.substr(blank_pos1+1) < s2.substr(blank_pos2+1)
                || (s1.substr(blank_pos1+1) == s2.substr(blank_pos2+1)
                    && s1.substr(0, blank_pos1) < s2.substr(0, blank_pos2));
        };
        sort(letter.begin(), letter.end(), comp);

        letter.insert(letter.end(), digits.begin(), digits.end() );

        return letter;
    }
};
//Runtime: 16 ms, faster than 62.67% of C++ online submissions for Reorder Data in Log Files.
//Memory Usage: 17 MB, less than 11.76% of C++ online submissions for Reorder Data in Log Files.
```
