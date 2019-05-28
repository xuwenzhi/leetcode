# sort-transformed-array

[https://leetcode.com/problems/sort-transformed-array/](https://leetcode.com/problems/sort-transformed-array/)

```
Given a sorted array of integers nums and integer values a, b and c. Apply a quadratic function of the form f(x) = ax2 + bx + c to each element x in the array.

The returned array must be in sorted order.

Expected time complexity: O(n)

Example 1:

Input: nums = [-4,-2,2,4], a = 1, b = 3, c = 5
Output: [3,9,15,33]
Example 2:

Input: nums = [-4,-2,2,4], a = -1, b = 3, c = 5
Output: [-23,-5,1,7]
```

# solution (multiset)

```c++
class Solution {
public:
    vector<int> sortTransformedArray(vector<int>& nums, int a, int b, int c) {
        multiset<int> s;
        for (auto i:nums) {
            s.insert(i*i*a + i*b + c);
        }
        
        vector<int> res;
        set<int>::iterator it = s.begin();
        for (;it!=s.end();++it) {
            res.push_back(*it);
        }
        
        return res;
    }
};
```

# solution (2 pointer)

这种是根据一元二次方程的特性来解决的，如果 a>0，则抛物线的顶点在底部，否则，抛物线的顶点在上方，根据这个特性然后在使用二分的方法来解决。

```c++
class Solution {
public:
    int cal(int x, int a, int b, int c) {
        return x*x*a+b*x+c;
    }
    
    vector<int> sortTransformedArray(vector<int>& nums, int a, int b, int c) {
        int l = nums.size();
        vector<int> res(l);
        if (l == 0) return res;
        
        int left = 0, right = l-1;
        int i = a >= 0 ? l - 1 : 0;
        while (left <= right) {
            int start = cal(nums[left], a, b, c);
            int end = cal(nums[right], a, b, c);
            if (a >= 0) {
                if (start >= end) {
                    res[i--] = start;
                    left++;
                } else {
                    res[i--] = end;
                    right--;
                }
            } else {
                if (start >= end) {
                    res[i++] = end;
                    right--;
                } else {
                    res[i++] = start;
                    left++;
                }
            }
        }
        
        return res;
    }
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for Sort Transformed Array.
//Memory Usage: 9 MB, less than 67.96% of C++ online submissions for Sort Transformed Array.
```


# refer

[My-easy-to-understand-Java-AC-solution-using-Two-pointers](https://leetcode.com/problems/sort-transformed-array/discuss/83317/)