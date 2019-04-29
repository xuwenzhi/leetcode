# move-zeroes

[https://leetcode.com/problems/move-zeroes/](https://leetcode.com/problems/move-zeroes/)

```
Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

Example:

Input: [0,1,0,3,12]
Output: [1,3,12,0,0]
Note:

You must do this in-place without making a copy of the array.
Minimize the total number of operations.
```

# solution

从左向右移动，遇到0就把对应的0起始位置和终止位置记录下来（因为会存在多个0），然后遇到数字的时候，进行交换就好，如果0很多，比如000234，那么对应交换为 234000，当然还有一种情况是 000204，这种情况就只交换第一个0，交换完之后为 20004，然后再向后进行.

```c++
// O(n) Runtime, O(1) Space.
class Solution {
public:
    void moveZeroes(vector<int>& nums) {
        int len = nums.size();
        int s = -1, e = -1;
        for (int i=0;i<len;i++) {
            if (nums[i] == 0) {
                if (s == -1) s = i;
                e = i;
            } else {
                if (s == -1) continue;
                int k = 0;
                while (i+k < len && s + k <= e) {
                    if (nums[i+k] == 0) {
                        break;
                    }
                    int tmp = nums[s+k];
                    nums[s+k] = nums[i+k];
                    nums[i+k] = tmp;
                    k++;
                }
                s += k;
                e = s + k - 1;
            }
        }
    }
};
//Runtime: 16 ms, faster than 99.23% of C++ online submissions for Move Zeroes.
//Memory Usage: 9.5 MB, less than 84.54% of C++ online submissions for Move Zeroes.
```

# solution (brilliant)

```
class Solution {
public:
    void moveZeroes(vector<int>& nums) {
        int j = 0;
        // move all the nonzero elements advance
        for (int i = 0; i < nums.size(); i++) {
            if (nums[i] != 0) {
                nums[j++] = nums[i];
            }
        }
        for (;j < nums.size(); j++) {
            nums[j] = 0;
        }
    }
};
```

refer:[https://leetcode.com/problems/move-zeroes/discuss/72005/](https://leetcode.com/problems/move-zeroes/discuss/72005/)
