# range-sum-query-immutable

[https://leetcode.com/problems/range-sum-query-immutable/](https://leetcode.com/problems/range-sum-query-immutable/)

```
Given an integer array nums, find the sum of the elements between indices i and j (i ≤ j), inclusive.

Example:

Given nums = [-2, 0, 3, -5, 2, -1]

sumRange(0, 2) -> 1
sumRange(2, 5) -> -1
sumRange(0, 5) -> -3
Note:

You may assume that the array does not change.
There are many calls to sumRange function.
```

# thinking

和[subarray-sum-equals-k](https://github.com/xuwenzhi/leetcode/blob/master/array/subarray-sum-equals-k.md) 以及 和[maximum-size-subarray-sum-equals-k](https://github.com/xuwenzhi/leetcode/blob/master/array/maximum-size-subarray-sum-equals-k.md) 一样一样的。

# solution 

```c++
class NumArray {
private:
    vector<int> presum;
public:
    NumArray(vector<int>& nums) {
        int sum = 0;
        for (auto i:nums) {
            sum += i;
            presum.push_back(sum);
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
 * int param_1 = obj->sumRange(i,j);
 */
//Runtime: 32 ms, faster than 91.21% of C++ online submissions for Range Sum Query - Immutable.
//Memory Usage: 17.6 MB, less than 10.36% of C++ online submissions for Range Sum Query - Immutable.
```

# solution (c)

```c
typedef struct NumArray{
    int* nums;
} NumArray;


NumArray* numArrayCreate(int* nums, int numsSize) {
    for (int i = 0 ; i< numsSize; i++){
        if(i == 0) 
            nums[i] = nums[0];
        else 
            nums[i] += nums[i - 1];
    }
    NumArray* tmp = (struct NumArray*) malloc (sizeof(struct NumArray));
    tmp->nums = nums;
    return tmp;
}

int numArraySumRange(NumArray* obj, int i, int j) {
    if (i < 1) {
        return obj->nums[j];
    } else{
        return obj->nums[j] - obj->nums[i-1];
    }
}

void numArrayFree(NumArray* obj) {
    free(obj);
}

/**
 * Your NumArray struct will be instantiated and called as such:
 * NumArray* obj = numArrayCreate(nums, numsSize);
 * int param_1 = numArraySumRange(obj, i, j);
 
 * numArrayFree(obj);
*/
//Runtime: 24 ms, faster than 75.21% of C online submissions for Range Sum Query - Immutable.
//Memory Usage: 12.4 MB, less than 100.00% of C online submissions for Range Sum Query - Immutable.
```