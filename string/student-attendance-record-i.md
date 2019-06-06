# student-attendance-record-i

[https://leetcode.com/problems/student-attendance-record-i/](https://leetcode.com/problems/student-attendance-record-i/)

```
You are given a string representing an attendance record for a student. The record only contains the following three characters:
'A' : Absent.
'L' : Late.
'P' : Present.
A student could be rewarded if his attendance record doesn't contain more than one 'A' (absent) or more than two continuous 'L' (late).

You need to return whether the student could be rewarded according to his attendance record.

Example 1:

Input: "PPALLP"
Output: True
Example 2:

Input: "PPALLL"
Output: False
```
# thinking

兄dei，注意统计 'L' 是要连续的。

# solution 

```c++
class Solution {
public:
    bool checkRecord(string s) {
        int aCnt=0, lCnt = 0;
        
        for (int i=0;i<s.length();i++) {
            if (s[i] == 'A') aCnt++;
            
            if (s[i] == 'L') {
                lCnt = 1;
                i++;
                while (i<s.length() && s[i] == 'L') {
                    lCnt++;
                    i++;
                }
                if (lCnt >= 3) return false;
                else i--;
            }
        }
        
        return aCnt <= 1;
    }
};
```