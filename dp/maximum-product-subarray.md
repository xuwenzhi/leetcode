# maximum-product-subarray

[https://leetcode.com/problems/maximum-product-subarray](https://leetcode.com/problems/maximum-product-subarray)

# thinking

和计算sum不同，这道题是计算乘积，这个就有点意思了，有几个场景需要考虑，比如如果上一个数是负数，那么负数*负数就会得到正数，而如果之前已经得到了一个很大的正数，突然出现了负数，就不会是我们预想的结果了，所以在这里，维护两个数，一个是最大正数，一个是最小负数，然后再比较一下就好了，而最大数F(x)和最小数G(x)的计算公式如下:

```
F(i) = max(F(i-1) * current, current, G(i-1) * current)
G(i) = min(G(i-1) * current, current, F(i-1) * current)
```

# solution

```c++
// O(n) Runtime, O(1) Space.
class Solution {
public:
    int maxProduct(vector<int>& nums) {
        int size = nums.size(), i;
        int resMax = nums[0], minProduct = nums[0], maxProduct = nums[0];
        for (i=1;i<size;i++) {
            // store original num, because the maxProduct process before minProduct.
            int mx = maxProduct, mi = minProduct;
            maxProduct = max(mx * nums[i], max(nums[i], mi * nums[i]));
            minProduct = min(mi * nums[i], min(nums[i], mx * nums[i]));
            
            resMax = max(resMax, maxProduct);
        }
        return resMax;
    }
};
//Runtime: 8 ms, faster than 71.70% of C++ online submissions for Maximum Product Subarray.
//Memory Usage: 9 MB, less than 80.36% of C++ online submissions for Maximum Product Subarray.
```

# other solution

[Possibly-simplest-solution-with-O(n)-time-complexity](https://leetcode.com/problems/maximum-product-subarray/discuss/48230/)
