# maximum-product-of-three-numbers

[https://leetcode.com/problems/maximum-product-of-three-numbers/](https://leetcode.com/problems/maximum-product-of-three-numbers/)

```
Given an integer array, find three numbers whose product is maximum and output the maximum product.

Example 1:

Input: [1,2,3]
Output: 6
 

Example 2:

Input: [1,2,3,4]
Output: 24
 

Note:

The length of the given array will be in range [3,104] and all elements are in the range [-1000, 1000].
Multiplication of any three numbers in the input won't exceed the range of 32-bit signed integer.
```

# solution (2 priority queue)

```c++
// O(nlogn) Runtime, O(1) Space.
class Solution {
public:
    int maximumProduct(vector<int>& nums) {
        if (nums.size() < 3) return 0;
        priority_queue<int, vector<int>, greater<int>> pq;
        priority_queue<int, vector<int>> pq2;
        for (auto i:nums) {
            pq.push(i);
            pq2.push(i);
            if (pq.size() > 3) {
                pq.pop();
            }
            if (pq2.size() > 2) {
                pq2.pop();
            }
        }
        int max1 = 0;
        if (pq2.top() < 0) {
            max1 = pq2.top();
            pq2.pop();
            if (pq2.top() < 0) {
                max1 *= pq2.top();
            } else {
                max1 = 0;
            }
        }
        
        int res = pq.top();
        pq.pop();
        res *= pq.top();
        pq.pop();
        
        res = max(res * pq.top(), max1 * pq.top());
        
        return res;
    }
};
```

# solution (sort)

```c++
// O(nlogn) Runtime, O(1) Space.
class Solution {
public:
    int maximumProduct(vector<int>& nums) {
        if (nums.size() < 3) return 0;
        sort(nums.begin(), nums.end());
        
        int negative = nums[0] * nums[1];
        int l = nums.size();
        int res = nums[l-3]*nums[l-2];
        
        res = max(res * nums[l-1], negative * nums[l-1]);
        
        return res;
    }
};
//Runtime: 64 ms, faster than 58.81% of C++ online submissions for Maximum Product of Three Numbers.
//Memory Usage: 10.8 MB, less than 80.62% of C++ online submissions for Maximum Product of Three Numbers.
```