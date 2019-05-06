# number-of-1-bits

[https://leetcode.com/problems/number-of-1-bits/](https://leetcode.com/problems/number-of-1-bits/)

```
Write a function that takes an unsigned integer and return the number of '1' bits it has (also known as the Hamming weight).



Example 1:

Input: 00000000000000000000000000001011
Output: 3
Explanation: The input binary string 00000000000000000000000000001011 has a total of three '1' bits.
Example 2:

Input: 00000000000000000000000010000000
Output: 1
Explanation: The input binary string 00000000000000000000000010000000 has a total of one '1' bit.
Example 3:

Input: 11111111111111111111111111111101
Output: 31
Explanation: The input binary string 11111111111111111111111111111101 has a total of thirty one '1' bits.


Note:

Note that in some languages such as Java, there is no unsigned integer type. In this case, the input will be given as signed integer type and should not affect your implementation, as the internal binary representation of the integer is the same whether it is signed or unsigned.
In Java, the compiler represents the signed integers using 2's complement notation. Therefore, in Example 3 above the input represents the signed integer -3.


Follow up:

If this function is called many times, how would you optimize it?
```

# solution

虽然给出的就是个二进制，不过我这里是使用bitset把uint32_t转为字符串，然后再统计1的个数就完事了.

```c++
class Solution {
public:
    int hammingWeight(uint32_t n) {
        string a = std::bitset< 32 >( n ).to_string();

        int res = 0;
        for (int i=0;i<a.size();i++) {
            if (a[i] == '1') res++;
        }

        return res;
    }
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for Number of 1 Bits.
//Memory Usage: 8.4 MB, less than 5.28% of C++ online submissions for Number of 1 Bits.
```


# solution (bitset.count())

```c++
class Solution {
public:
    int hammingWeight(uint32_t n) {
        return bitset<32>(n).count();
    }
};
```

refer:[bitset](http://www.cplusplus.com/reference/bitset/)
