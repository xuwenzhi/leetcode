# how-many-numbers-are-smaller-than-the-current-numbers

[https://leetcode.com/problems/how-many-numbers-are-smaller-than-the-current-number/](https://leetcode.com/problems/how-many-numbers-are-smaller-than-the-current-number/)

```
Given the array nums, for each nums[i] find out how many numbers in the array are smaller than it. That is, for each nums[i] you have to count the number of valid j's such that j != i and nums[j] < nums[i].

Return the answer in an array.



Example 1:

Input: nums = [8,1,2,2,3]
Output: [4,0,1,1,3]
Explanation:
For nums[0]=8 there exist four smaller numbers than it (1, 2, 2 and 3).
For nums[1]=1 does not exist any smaller number than it.
For nums[2]=2 there exist one smaller number than it (1).
For nums[3]=2 there exist one smaller number than it (1).
For nums[4]=3 there exist three smaller numbers than it (1, 2 and 2).
Example 2:

Input: nums = [6,5,4,8]
Output: [2,1,0,3]
Example 3:

Input: nums = [7,7,7,7]
Output: [0,0,0,0]


Constraints:

2 <= nums.length <= 500
0 <= nums[i] <= 100
```

# thinking
排个序，然后在记录用一个 **hashtable** 存储已经遍历过的数量，就是小于当前值的数量，类似于这个case  [8,1,2,2,3]

```
sorted : [1,2,2,3,8]

loop 1 : m[1] = 0
loop 2 : m[2] = 1
loop 3 : m[2] = 1
loop 4 : m[3] = 2
loop 5 : m[8] = 3
```

嗯，这就很清晰了。

# solution

```c++
class Solution {
public:
    vector<int> smallerNumbersThanCurrent(vector<int>& nums) {
        vector<int> tmp = nums;
        sort(tmp.begin(), tmp.end());
        unordered_map<int,int> m;
        int count = 0;
        for (int i=0;i<tmp.size();i++) {
            if (m.find(tmp[i]) == m.end()) {
                m[tmp[i]] = count;
            }
            count++;
        }

        vector<int> result;
        for (int i=0;i<nums.size();i++) {
            result.push_back(m[nums[i]]);
        }

        return result;
    }
};
```
