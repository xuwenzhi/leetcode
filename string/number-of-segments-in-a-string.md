# number-of-segments-in-a-string

[https://leetcode.com/problems/number-of-segments-in-a-string/](https://leetcode.com/problems/number-of-segments-in-a-string/)

```
Count the number of segments in a string, where a segment is defined to be a contiguous sequence of non-space characters.

Please note that the string does not contain any non-printable characters.

Example:

Input: "Hello, my name is John"
Output: 5
```

# solution (stringstream)

```c++
class Solution {
public:
    int countSegments(string s) {
        int res = 0;
        string word; 
        stringstream iss(s); 
        while (iss >> word) {
            res++;
        }

        return res;
    }
};
//Runtime: 4 ms, faster than 69.47% of C++ online submissions for Number of Segments in a String.
//Memory Usage: 8.4 MB, less than 22.93% of C++ online submissions for Number of Segments in a String.
```

# solution 

```c++

```