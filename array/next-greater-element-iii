# next-greater-element-iii

[https://leetcode.com/problems/next-greater-element-iii/](https://leetcode.com/problems/next-greater-element-iii/)

```
Given a positive 32-bit integer n, you need to find the smallest 32-bit integer which has exactly the same digits existing in the integer n and is greater in value than n. If no such positive 32-bit integer exists, you need to return -1.

Example 1:

Input: 12
Output: 21
 

Example 2:

Input: 21
Output: -1
```

# thinking

由于要取得大于该数的最小值，所以自然而然要从右侧开始走起，依次从右往左走，我们要找到需要换位的那个地方，比如 443422，此时的3也就是需要我们换位的地方，定位到3这个位置，然后将3右侧的部分做从小到大排序，这样就保证了右侧的数据是最小的，此时位443224，然后从3开始向右遍历，遍历到第一个大于3的数，即位4，然后做swap操作，则得到结果位 444223。还需要注意是32位。

refer[https://leetcode.com/problems/next-greater-element-iii/discuss/101825/C%2B%2B-Solution-with-explanation](https://leetcode.com/problems/next-greater-element-iii/discuss/101825/C%2B%2B-Solution-with-explanation)

# solution

```c++
class Solution {
public:
    int nextGreaterElement(int n) {
        string s = to_string(n);
        int len = s.size();
        int cur = len - 2;
        int high_bit = 0;
        
        for (; cur >= 0 && s[cur] >= s[cur+1]; cur--);
        
        if (cur == -1) return -1;
        
        sort(s.begin() + cur + 1, s.end());
        
        for (int j = cur + 1; j < len; j++) {
            if (s[cur] < s[j]) {
                swap(s[cur], s[j]);
                break;
            } 
        }
    
        long res = stol(s);
        return res == n || res > INT_MAX ? -1 : res;
    }
};
```

Runtime: 4 ms, faster than 100.00% of C++ online submissions for Next Greater Element III.

Memory Usage: 8.4 MB, less than 81.82% of C++ online submissions for Next Greater Element III.
