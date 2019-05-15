# permutation-sequence

[https://leetcode.com/problems/permutation-sequence/](https://leetcode.com/problems/permutation-sequence/)

```
The set [1,2,3,...,n] contains a total of n! unique permutations.

By listing and labeling all of the permutations in order, we get the following sequence for n = 3:

"123"
"132"
"213"
"231"
"312"
"321"
Given n and k, return the kth permutation sequence.

Note:

Given n will be between 1 and 9 inclusive.
Given k will be between 1 and n! inclusive.
Example 1:

Input: n = 3, k = 3
Output: "213"
Example 2:

Input: n = 4, k = 9
Output: "2314"
```

# solution (stl next_permutation)

emmmm,这个方案就比较难以启齿了，使用到C++内置的**next_permutation()**来依次生成下一个permutation，所以效率上肯定很差劲.

```c++
// O(l*k) Runtime, O(n) Space.
class Solution {
public:
    vector<int> generate(int n) {
        vector<int> res(n);
        for (int i=0;i<n;i++) {
            res[i] = i+1;
        }

        return res;
    }

    string convertTstr(vector<int> seq) {
        string res = "";
        for (int a : seq) {
            res += a + '0';
        }

        return res;
    }

    string getPermutation(int n, int k) {
        vector<int> seq = generate(n);

        int times = 1;
        while (next_permutation(seq.begin(), seq.end())) {
            times++;
            if (times == k) {
                break;
            }
        }

        return convertTstr(seq);
    }
};
//Runtime: 340 ms, faster than 13.39% of C++ online submissions for Permutation Sequence.
//Memory Usage: 8.2 MB, less than 73.88% of C++ online submissions for Permutation Sequence.
```

# solution (n! permutation)

这个方法是最优的，主要用到的思想是这样的，假如case为 n = 4 , k = 8，则n=4的所有全排列为24个，也就是**4 * 3!**。如下，以1为开头的数量即正好为 **3!**。假如给定**string nums = "123456789"**，那么第k个全排列的第一个数也就为 **nums[k/(n-1)!] 即 nums[8/(3!)] = 2**，嗯，以此类推.

```
[1,2,3,4]
[1,2,4,3]
[1,3,2,4]
[1,3,4,2]
[1,4,2,3]
[1,4,3,2]
[2,1,3,4]
[2,1,4,3]
[2,3,1,4]
[2,3,4,1]
//...
```

```c++
class Solution {
public:
    string getPermutation(int n, int k) {
        string nums = "123456789";
        string res = "";
        vector<int> m(n, 1);

        k--; //这是个疑惑点,由于我们的方案是一次过掉n!，想象一种特殊情况，当k=1时，在任何一位都不能跳过的~
        for (int i=1;i<n;i++) m[i] = m[i-1] * i;
        for (int i=n;i>0;i--) {
            int j = k / m[i - 1];
            k %= m[i - 1];
            res.push_back(nums[j]);
            nums.erase(j, 1);
        }

        return res;
    }
};
//Runtime: 0 ms, faster than 100.00% of C++ online submissions for Permutation Sequence.
//Memory Usage: 8.3 MB, less than 70.90% of C++ online submissions for Permutation Sequence.
```
