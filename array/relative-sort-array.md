# relative-sort-array

[https://leetcode.com/problems/relative-sort-array/](https://leetcode.com/problems/relative-sort-array/)

```
Given two arrays arr1 and arr2, the elements of arr2 are distinct, and all elements in arr2 are also in arr1.

Sort the elements of arr1 such that the relative ordering of items in arr1 are the same as in arr2.  Elements that don't appear in arr2 should be placed at the end of arr1 in ascending order.

 

Example 1:

Input: arr1 = [2,3,1,3,2,4,6,7,9,2,19], arr2 = [2,1,4,3,9,6]
Output: [2,2,2,1,4,3,3,9,6,7,19]
 

Constraints:

arr1.length, arr2.length <= 1000
0 <= arr1[i], arr2[i] <= 1000
Each arr2[i] is distinct.
Each arr2[i] is in arr1.
```

# thinking

首先统计出arr1中元素的数量，然后遍历arr2，搞到结果里就好，我这里使用的是Hashtable来统计arr1数量的，不过后来发现有这样的条件 **0 <= arr1[i], arr2[i] <= 1000**，其实使用一个1001大小的数组也可以搞定。

# solution 

```c++
class Solution {
public:
    vector<int> relativeSortArray(vector<int>& arr1, vector<int>& arr2) {
        unordered_map<int, int> m;
        for (auto i:arr1) {
            m[i]++;
        }
        
        vector<int> res;
        for (auto i:arr2) {
            while (m[i]-- > 0) {
                res.push_back(i);
            }
            m.erase(i);
        }
        int l = res.size();
        for (auto i:m) {
            while (i.second-- > 0) {
                res.push_back(i.first);
            }
        }
        sort(res.begin() + l, res.end());
        return res;
    }
};
//Runtime: 0 ms, faster than 100.00% of C++ online submissions for Relative Sort Array.
//Memory Usage: 9.1 MB, less than 100.00% of C++ online submissions for Relative Sort Array.
```