# binary-number-with-alternating-bits

[https://leetcode.com/problems/binary-number-with-alternating-bits/](https://leetcode.com/problems/binary-number-with-alternating-bits/)

```
Given a positive integer, check whether it has alternating bits: namely, if two adjacent bits will always have different values.

Example 1:

Input: 5
Output: True
Explanation:
The binary representation of 5 is: 101
Example 2:

Input: 7
Output: False
Explanation:
The binary representation of 7 is: 111.
Example 3:

Input: 11
Output: False
Explanation:
The binary representation of 11 is: 1011.
Example 4:

Input: 10
Output: True
Explanation:
The binary representation of 10 is: 1010.
```

# solution 

```c++
class Solution {
public:
    bool hasAlternatingBits(int n) {
        if (n <= 0) return true;
        string b = bitset<32>(n).to_string();
        
        int pos = b.find_first_of('1');
        for (;pos<32;pos++) {
            if (b[pos] == b[pos-1]) {
                return false;
            }
        }
        
        return true;
    }
};
//Runtime: 4 ms, faster than 80.47% of C++ online submissions for Binary Number with Alternating Bits.
//Memory Usage: 8.3 MB, less than 41.37% of C++ online submissions for Binary Number with Alternating Bits.
```