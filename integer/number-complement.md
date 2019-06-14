# number-complement

[https://leetcode.com/problems/number-complement/](https://leetcode.com/problems/number-complement/)

```
Given a positive integer, output its complement number. The complement strategy is to flip the bits of its binary representation.

Note:

The given integer is guaranteed to fit within the range of a 32-bit signed integer.
You could assume no leading zero bit in the integer’s binary representation.
Example 1:

Input: 5
Output: 2
Explanation: The binary representation of 5 is 101 (no leading zero bits), and its complement is 010. So you need to output 2.
Example 2:

Input: 1
Output: 0
Explanation: The binary representation of 1 is 1 (no leading zero bits), and its complement is 0. So you need to output 0.
```

# solution 

```c++
class Solution {
public:
    int findComplement(int num) {
        if (num <=0) return 1;
        string n = bitset<32>(num).to_string();
        
        int pos = n.find_first_of('1');
        for (;pos<32;pos++) {
            if (n[pos] == '1') n[pos] = '0';
            else n[pos] = '1';
        }
        
        return stoi(n, 0, 2);
    }
};
//Runtime: 0 ms, faster than 100.00% of C++ online submissions for Number Complement.
//Memory Usage: 8.3 MB, less than 48.59% of C++ online submissions for Number Complement.
```