# find-all-duplicates-in-an-array

[https://leetcode.com/problems/find-all-duplicates-in-an-array/](https://leetcode.com/problems/find-all-duplicates-in-an-array/)

```
Given an array of integers, 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.

Find all the elements that appear twice in this array.

Could you do it without extra space and in O(n) runtime?

Example:

Input:
[4,3,2,7,8,2,3,1]

Output:
[2,3]
```

# thinking

"Could you do it without extra space and in O(n) runtime?" 意思是尽量不使用额外的空间来处理，第一个想到的肯定就是 **swap** 了。

# solution (hashtable)

使用Hashtable记录数字及出现的次数，最后再遍历Hashtable，如果次数 > 1，则就是结果。

```c++
// O(n) Runtime, O(n) Space.
class Solution {
public:
    vector<int> findDuplicates(vector<int>& nums) {
        unordered_map<int,int> m;
        for (auto i : nums) {
            m[i]++;
        }
        
        vector<int> res;
        for (auto i:m) {
            if (i.second > 1) {
                res.push_back(i.first);
            }
        }
        
        return res;
    }
};
//Runtime: 156 ms, faster than 15.19% of C++ online submissions for Find All Duplicates in an Array.
//Memory Usage: 27 MB, less than 10.45% of C++ online submissions for Find All Duplicates in an Array.
```


# solution (sort)

对数组排序，这样重复的数字就是连续出现的，这时候再计算重复的数字即可。

```c++
// O(nlogn) Runtime, O(1) Space.
class Solution {
public:
    vector<int> findDuplicates(vector<int>& nums) {
        int l = nums.size();
        sort(nums.begin(), nums.end());
        
        int i=0;
        vector<int> res;
        while (i<l) {
            int cur = nums[i], j = i+1;
            
            while (j < l && nums[j] == cur) {
                j++;
            }
            if (i+1 != j) {
                res.push_back(cur);
                i = j;
            } else {
                i++;
            }
        }
        
        return res;
    }
};
//Runtime: 136 ms, faster than 25.36% of C++ online submissions for Find All Duplicates in an Array.
//Memory Usage: 14.9 MB, less than 63.43% of C++ online submissions for Find All Duplicates in an Array.
```


# solution (multiset)

由于multiset本身就是排序的，而且允许插入重复元素，所以先将所有元素存储到multiset中，然后再从头遍历，检查是否有重复元素。

```
// O(nlogn) Runtime, O(n) Space.
class Solution {
public:
    vector<int> findDuplicates(vector<int>& nums) {
        multiset<int> s(nums.begin(), nums.end());
        
        int i=0;
        vector<int> res;
        std::multiset<int>::iterator curr = s.begin();
        for( ; curr != s.end(); ) {
            std::multiset<int>::iterator next = curr;
            if( ++next != s.end() && *next == *curr ) {
                res.push_back(*curr);
                while( ++next != s.end() && *next == *curr );
            }
            curr = next;
         }
        
        return res;
    }
};
//Runtime: 220 ms, faster than 5.00% of C++ online submissions for Find All Duplicates in an Array.
//Memory Usage: 34.1 MB, less than 5.05% of C++ online submissions for Find All Duplicates in an Array.
```

# solution (swap)

一种swap的方案，可能类似于[find-all-numbers-disappeared-in-an-array](https://github.com/xuwenzhi/leetcode/blob/master/array/find-all-numbers-disappeared-in-an-array.md)和[first-missing-positive](https://github.com/xuwenzhi/leetcode/blob/master/array/first-missing-positive.md)，不过swap的规律不尽相同。

拿case [4,3,2,7,8,2,3,1] 为例

```
// i = 0 时的swap变化，当nums[i] == nums[nums[i]-1]时，就没有必要在走下去了，因为这时候3已经是结果之一。后面依次类推。

[7,3,2,4,8,2,3,1]
[3,3,2,4,8,2,7,1]
[2,3,3,4,8,2,7,1]
[3,2,3,4,8,2,7,1]
```

```c++
class Solution {
public:
    vector<int> findDuplicates(vector<int>& nums) {
        int l = nums.size();
        for (int i=0;i<l;i++) {
            if (i+1 != nums[i]) {
                swap(nums[i], nums[nums[i]-1]);
                if (nums[i] != nums[nums[i]-1]) i--;
            }
        }
        vector<int> res;
        for (int i=0;i<l;i++) {
            if (i+1 != nums[i]) res.push_back(nums[i]);
        }
        
        return res;
    }
};
```

# solution (opposite number)

利用相反数的解法，将 nums[nums[i]-1] 搞为负数，如果再次遇到重复的数，那么会将该位置的数字搞回整数，那么这就是结果。

```c++
class Solution {
public:
    vector<int> findDuplicates(vector<int>& nums) {
        int l = nums.size();
        vector<int> res;
        for (int i=0;i<l;i++) {
            nums[abs(nums[i])-1] = -nums[abs(nums[i])-1];
            if (nums[abs(nums[i])-1] > 0) res.push_back(abs(nums[i]));
        }
        
        return res;
    }
};
//Runtime: 116 ms, faster than 89.06% of C++ online submissions for Find All Duplicates in an Array.
//Memory Usage: 14.9 MB, less than 71.70% of C++ online submissions for Find All Duplicates in an Array.
```

# refer

[C++ beats 98%](https://leetcode.com/problems/find-all-duplicates-in-an-array/discuss/92395/)