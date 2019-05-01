# jump-game-ii

[https://leetcode.com/problems/jump-game-ii/](https://leetcode.com/problems/jump-game-ii/)

```
Given an array of non-negative integers, you are initially positioned at the first index of the array.

Each element in the array represents your maximum jump length at that position.

Your goal is to reach the last index in the minimum number of jumps.

Example:

Input: [2,3,1,1,4]
Output: 2
Explanation: The minimum number of jumps to reach the last index is 2.
    Jump 1 step from index 0 to 1, then 3 steps to the last index.
Note:

You can assume that you can always reach the last index.
```

# solution

这个解决方案的思路就是从左向右走，每次选择当前位置所能达到的最右的位置，然后每次都能得到一个**局部最优解**，其中maxIndex也就是每次得到的局部最优index。

// O(n) Runtime, O(1) Space.
```c++
class Solution {
public:
    int jump(vector<int>& nums) {
        int l = nums.size();
        if (l <= 1) return 0;

        vector<int> vec{};
        int i = 0;
        while (i < l-1) {
            if (nums[i] == 0) {
                i++;
                continue;
            }
            int cur = i;
            int maxIndex = -1;
            int maxValue = -1;
            // 如果当前值直接到达终点，那么直接push,然后break，for case[2,0]
            if (cur + nums[cur] >= l - 1) {
                vec.push_back(cur);
                break;
            }

            for (int j=1;nums[cur] < l && j<=nums[cur];j++) {
                if (nums[cur+j] == 0) continue;
                if (nums[cur+j] + cur+j >= maxValue) {
                    maxValue = nums[cur+j] + cur+j;
                    maxIndex = cur+j;
                }
            }
            i = maxIndex;
            vec.push_back(maxIndex);
        }

        return vec.size();
    }
};
//Runtime: 12 ms, faster than 98.17% of C++ online submissions for Jump Game II.
//Memory Usage: 10.6 MB, less than 73.72% of C++ online submissions for Jump Game II.
```
