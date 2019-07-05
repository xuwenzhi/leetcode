# binary-subarrays-with-sum

[https://leetcode.com/problems/binary-subarrays-with-sum/](https://leetcode.com/problems/binary-subarrays-with-sum/)

```
In an array A of 0s and 1s, how many non-empty subarrays have sum S?

 

Example 1:

Input: A = [1,0,1,0,1], S = 2
Output: 4
Explanation: 
The 4 subarrays are bolded below:
[1,0,1,0,1]
[1,0,1,0,1]
[1,0,1,0,1]
[1,0,1,0,1]
 

Note:

A.length <= 30000
0 <= S <= A.length
A[i] is either 0 or 1.
```

# solution (presum) 

这个解法完全是从[[Medium]subarray-sum-equals-k - 子数组和为K的数量](https://github.com/xuwenzhi/leetcode/blob/master/array/subarray-sum-equals-k.md)拷贝过来，解决方案是一模一样的，当然也就没有利用到本题数组中仅有 0 和 1 的特性。

```c++
class Solution {
public:
    int numSubarraysWithSum(vector<int>& A, int S) {
        int res = 0;
        unordered_map<int, int> m{};
        int presum = 0;

        m[0] = 1;
        for (int i=0;i<A.size();i++) {
            presum += A[i];
            res += m[presum - S];
            m[presum]++;
        }

        return res;
    }
};
//Runtime: 60 ms, faster than 33.33% of C++ online submissions for Binary Subarrays With Sum.
//Memory Usage: 19 MB, less than 27.38% of C++ online submissions for Binary Subarrays With Sum.
```


# solution

这种解法也没想到一个名字，不过还是很巧妙的，这种方法是首先把数组中 1 存在的下标记录下来，比如case [1,0,1,0,1]，处理到 index中 即为 [-1, 0, 2, 4, 5] **不要忽略掉首尾**，然后只要遍历计算 index 即可。

1. 0 需要单独计算，n个0所能组成的组合是一个等差数列。

2. 计算时计算 1 两边的 0 的个数，进行相乘即可了。

```c++
class Solution {
public:
    int numSubarraysWithSum(vector<int>& A, int S) {
        int res = 0;
        vector<int> index{-1};
        for (int i=0;i<A.size();i++) {
            if (A[i]) index.push_back(i);
        }
        index.push_back(A.size());
        
        if (S == 0) {
            for (int i=1;i<index.size();i++) {
                int n = index[i] - index[i-1]-1;
                res += (1 + n) * n / 2;
            }
            return res;
        }
        
        int i=1, j;
        while (j<index.size()) {
            j = i+S;
            if (j >= index.size()) break;
            res += (index[i] - index[i-1]) 
                    * (index[j] - index[j-1]);
            
            i++;
        }

        return res;
    }
};
//Runtime: 40 ms, faster than 59.79% of C++ online submissions for Binary Subarrays With Sum.
//Memory Usage: 12 MB, less than 57.54% of C++ online submissions for Binary Subarrays With Sum.
```


# refer

[Leetcode 930 Binary Subarrays With Sum](https://buptwc.com/2018/10/28/Leetcode-930-Binary-Subarrays-With-Sum/)