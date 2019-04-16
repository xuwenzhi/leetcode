# single-number

[https://leetcode.com/problems/single-number/](https://leetcode.com/problems/single-number/)

```
Given a non-empty array of integers, every element appears twice except for one. Find that single one.

Note:

Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

Example 1:

Input: [2,2,1]
Output: 1
Example 2:

Input: [4,1,2,1,2]
Output: 4
```

# thinking

这个解决方案就是最优的了，充分利用了XOR的特性。

当然，如果使用一些额外的数据来存储，也是可以的，只不过时间复杂度会更多.

# solution (XOR)

```
// O(n) Runtime, O(1) Space.
int singleNumber(int* nums, int numsSize) {
    int res = 0;

    for (int i = 0; i < numsSize; i++) {
        res = res ^ nums[i];
    }

    return res;
}
//Runtime: 4 ms
//Memory Usage: 7.9 MB
```

# solution (HashMap)
```
// O(n) Runtime, O(n) Space.
class Solution {
public:
    int singleNumber(vector<int>& nums) {
        unordered_map<int, int> map;
        for (int i = 0;i<nums.size();i++) {
            if (map.find(nums[i]) != map.end()) {
                cout<<nums[i]<<endl;
                map[nums[i]] ++;
                continue;
            }
            map.insert(std::make_pair(nums[i], 1));
        }

        for (auto i : map) {
            if (i.second == 1) {
                return i.first;
            }
        }
        return 0;
    }
};
//Runtime: 72 ms, faster than 5.15% of C++ online submissions for Single Number.
//Memory Usage: 11.4 MB, less than 16.09% of C++ online submissions for Single Number.
```


# relative

[Single Number ii](https://leetcode.com/problems/single-number-ii/)

[Single Number iii](https://leetcode.com/problems/single-number-iii/)
