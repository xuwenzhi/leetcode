# range-sum-query-mutable

[https://leetcode.com/problems/range-sum-query-mutable/](https://leetcode.com/problems/range-sum-query-mutable/)

```
Given an integer array nums, find the sum of the elements between indices i and j (i ≤ j), inclusive.

The update(i, val) function modifies nums by updating the element at index i to val.

Example:

Given nums = [1, 3, 5]

sumRange(0, 2) -> 9
update(1, 2)
sumRange(0, 2) -> 8
Note:

The array is only modifiable by the update function.
You may assume the number of calls to update and sumRange function is distributed evenly.
```

# solution (presum)

保存数组的Presum，当发生update时，在对应位置更新presum后面的值。

```c++
class NumArray {
private:
    vector<int> v;
    vector<int> presum;
public:
    NumArray(vector<int>& nums) {
        int sum = 0;
        for (auto i:nums) {
            sum += i;
            v.push_back(i);
            presum.push_back(sum);
        }
    }
    
    void update(int i, int val) {
        if (i>=presum.size()) return;
        
        int gap = val - v[i];
        v[i] = val;
        if (gap == 0) return;
        
        for (int j = i;j<v.size();j++) {
            presum[j] += gap;
        }
    }
    
    int sumRange(int i, int j) {
        if (i == 0) return presum[j];
        
        return presum[j] - presum[i-1];
    }
};
/**
 * Your NumArray object will be instantiated and called as such:
 * NumArray* obj = new NumArray(nums);
 * obj->update(i,val);
 * int param_2 = obj->sumRange(i,j);
 */
//Runtime: 172 ms, faster than 18.42% of C++ online submissions for Range Sum Query - Mutable.
//Memory Usage: 19.3 MB, less than 35.56% of C++ online submissions for Range Sum Query - Mutable.
```

# solution (group)


这种解法是使用两个数组，第一个数组为二维数组v，将nums进行分组存入到v中，例如代码中 **# define gap 80** 至于这个80怎么得来，则需要根据具体case的长度而定，我在测试过程中实验了几个最后选定了80。另外一个数组presum则用于存储每个组的总和。

- 在进行update操作时，只需要更新对应组对应位置的值即可，然后再对应更新presum的值。

- 在进行sumRange操作时，判断i和j具体属于哪个组，然后将两者之间的总和计算即可。

```c++
#define gap 80
class NumArray {
private:
    vector<vector<int>> v;
    vector<int> presum;
public:
    NumArray(vector<int>& nums) {
        int sum = 0;
        for (int i=0;i<nums.size();i++) {
            int j = i/gap;
            if (v.size() <= j) {
                v.push_back({});
            }
            v[j].push_back(nums[i]);
            if (presum.size() <= j) presum.push_back(0);
            presum[j] += nums[i];
        }
    }
    
    void update(int i, int val) {
        int j = i/gap;
        int tmp = val - v[j][i%gap];
        v[j][i%gap] += tmp;
        presum[j] += tmp;
    }
    
    int sumRange(int i, int j) {
        int ii = i/gap, jj = j/gap;
        int posi = i % gap, posj = j % gap;
        // 如果i j 在一个组中，只需要定位到这个组然后计算accumulate即可
        if (ii == jj) {
            return accumulate(v[ii].begin() + posi, v[ii].begin() + posj+1, 0);
        }
        // 如果不在一个组，则将i组到j组的所有和拿到，然后减去i组中i前面的部分，再减去j组中j后面的部分。
        int res = accumulate(presum.begin() + ii, presum.begin() + jj+1, 0);
        return res - 
            accumulate(v[ii].begin(), v[ii].begin() + posi, 0) - 
            accumulate(v[jj].begin()+posj+1, v[jj].end(), 0);
    }
};
/**
 * Your NumArray object will be instantiated and called as such:
 * NumArray* obj = new NumArray(nums);
 * obj->update(i,val);
 * int param_2 = obj->sumRange(i,j);
 */
//Runtime: 32 ms, faster than 97.14% of C++ online submissions for Range Sum Query - Mutable.
//Memory Usage: 19.5 MB, less than 32.80% of C++ online submissions for Range Sum Query - Mutable.
```