# unique-number-of-occurrences

[https://leetcode.com/problems/unique-number-of-occurrences/](https://leetcode.com/problems/unique-number-of-occurrences/)

```
Given an array of integers arr, write a function that returns true if and only if the number of occurrences of each value in the array is unique.



Example 1:

Input: arr = [1,2,2,1,1,3]
Output: true
Explanation: The value 1 has 3 occurrences, 2 has 2 and 3 has 1. No two values have the same number of occurrences.
Example 2:

Input: arr = [1,2]
Output: false
Example 3:

Input: arr = [-3,0,1,-3,1,1,1,-3,10,0]
Output: true


Constraints:

1 <= arr.length <= 1000
-1000 <= arr[i] <= 1000
```

# solution (Vector + Hashtable)

这道题一看就是个 **HashTable** 的问题，不过我想先通过一个范围为 **2001** 大小的数组来存储数字出现的次数，所以就有了如下的方案来试试水，不过效果吗？就不是特别理想了。

```c++
class Solution {
public:
    bool uniqueOccurrences(vector<int>& arr) {
        vector<int> v(2001, 0);
        unordered_map<int,bool> m;
        for (auto i : arr) {
            v[i+1000]++;
        }

        for (auto i:v) {
            if (i != 0 && m.find(i) != m.end()) {
                return false;
            }
            m[i] = true;
        }

        return true;
    }
};
//Runtime: 8 ms, faster than 11.32% of C++ online submissions for Unique Number of Occurrences.
//Memory Usage: 9.6 MB, less than 100.00% of C++ online submissions for Unique Number of Occurrences.
```


# solution (hashtable)

而这个方案就是纯 **HashTable** 来实现的，在速度上当然领先一步。

```c++
class Solution {
public:
    bool uniqueOccurrences(vector<int>& arr) {
        unordered_map<int, int> counter;
        unordered_map<int, bool> m;
        for (auto i : arr) {
            if (counter.find(i) == counter.end()) {
                counter[i] = 1;
            } else {
                counter[i]++;
            }
        }

        for (auto i:counter) {
            if (m.find(i.second) != m.end()) {
                return false;
            }
            m[i.second] = true;
        }

        return true;
    }
};
//Runtime: 0 ms, faster than 100.00% of C++ online submissions for Unique Number of Occurrences.
//Memory Usage: 8.9 MB, less than 100.00% of C++ online submissions for Unique Number of Occurrences.
```
