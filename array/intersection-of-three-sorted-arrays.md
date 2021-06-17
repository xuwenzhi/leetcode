# intersection-of-three-sorted-arrays

[]()

```
Given three integer arrays arr1, arr2 and arr3 sorted in strictly increasing order, return a sorted array of only the integers that appeared in all three arrays.

 

Example 1:

Input: arr1 = [1,2,3,4,5], arr2 = [1,2,5,7,9], arr3 = [1,3,4,5,8]
Output: [1,5]
Explanation: Only 1 and 5 appeared in the three arrays.
Example 2:

Input: arr1 = [197,418,523,876,1356], arr2 = [501,880,1593,1710,1870], arr3 = [521,682,1337,1395,1764]
Output: []
 

Constraints:

1 <= arr1.length, arr2.length, arr3.length <= 1000
1 <= arr1[i], arr2[i], arr3[i] <= 2000
```

# thinking

1. 排序的就需要考虑 **binary search** 了

2. 还是可以用 **hashtable** 来解决


# solution (hashtable)

```c++
// O(n) + O(m) + O(k)
class Solution {
public:
    vector<int> arraysIntersection(vector<int>& arr1, vector<int>& arr2, vector<int>& arr3) {
        vector<int> ans;
        if (arr1.size() == 0 
            || arr2.size() == 0 
            || arr3.size() == 0) {
            return ans;
        }
            
        unordered_map<int, bool> m1, m2;
        for (auto n: arr1) {
            m1[n] = true;
        }
        for (auto n: arr2) {
            m2[n] = true;
        }
        
        for (auto n: arr3) {
            auto it1 = m1.find(n), it2 = m2.find(n);
            if (it1 != m1.end() && it2 != m2.end()) {
                ans.push_back(n);
                m1.erase(it1);
                m2.erase(it2);
            }
        }
        
        return ans;
    }
};
//Runtime: 20 ms, faster than 14.92% of C++ online submissions for Intersection of Three Sorted Arrays.
//Memory Usage: 13.7 MB, less than 16.98% of C++ online submissions for Intersection of Three Sorted Arrays.
```

# solution (binary search)

```c++
// O(klog(m)log(n))
class Solution {
public:
    vector<int> arraysIntersection(vector<int>& arr1, vector<int>& arr2, vector<int>& arr3) {
        vector<int> ans;
        if (arr1.size() == 0 
            || arr2.size() == 0 
            || arr3.size() == 0) {
            return ans;
        }
            
        for (auto n: arr3) {
            if (binary_search(arr1.begin(), arr1.end(), n) 
                && binary_search(arr2.begin(), arr2.end(), n) ) {
                ans.push_back(n);
            }
        }
        
        return ans;
    }
};
//Runtime: 12 ms, faster than 62.09% of C++ online submissions for Intersection of Three Sorted Arrays.
//Memory Usage: 11.8 MB, less than 82.16% of C++ online submissions for Intersection of Three Sorted Arrays.
```

