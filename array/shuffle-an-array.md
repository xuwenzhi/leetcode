# shuffle-an-array

[https://leetcode.com/problems/shuffle-an-array/](https://leetcode.com/problems/shuffle-an-array/)

```
Shuffle a set of numbers without duplicates.

Example:

// Init an array with set 1, 2, and 3.
int[] nums = {1,2,3};
Solution solution = new Solution(nums);

// Shuffle the array [1,2,3] and return its result. Any permutation of [1,2,3] must equally likely to be returned.
solution.shuffle();

// Resets the array back to its original configuration [1,2,3].
solution.reset();

// Returns the random shuffling of array [1,2,3].
solution.shuffle();
```

# thinking

不知道为什么，看到 **random** 就想起了 **水塘抽样** ，也不知道能不能利用起来。


# solution (c++ built-in)

```c++
class Solution {
public:
    Solution(vector<int>& nums) {
        this->original = nums;
        this->nums = nums;
    }

    /** Resets the array to its original configuration and return it. */
    vector<int> reset() {
        return this->original;
    }

    /** Returns a random shuffling of the array. */
    vector<int> shuffle() {
        random_shuffle(this->nums.begin(), this->nums.end());
        return this->nums;
    }
private:
    vector<int> original;
    vector<int> nums;
};

/**
 * Your Solution object will be instantiated and called as such:
 * Solution* obj = new Solution(nums);
 * vector<int> param_1 = obj->reset();
 * vector<int> param_2 = obj->shuffle();
 */
//Runtime: 204 ms, faster than 75.56% of C++ online submissions for Shuffle an Array.
//Memory Usage: 30.3 MB, less than 42.86% of C++ online submissions for Shuffle an Array.
```

# solution (random)

这是一种 **in-place** 的shuffle，思路很简单，就是生成一个 random number，然后和当前值交换。

刚刚查了下资料，原来我这个是 **Fisher-Yates Algorithm**。

```c++
class Solution {
public:
    Solution(vector<int>& nums) {
        this->original = nums;
        this->nums = nums;
    }

    /** Resets the array to its original configuration and return it. */
    vector<int> reset() {
        return this->original;
    }

    /** Returns a random shuffling of the array. */
    vector<int> shuffle() {
        int l = this->nums.size();
        while (l) {
            int i = rand() % l--;
            swap(this->nums[l], this->nums[i]);
        }

        return this->nums;
    }
private:
    vector<int> original;
    vector<int> nums;
};

/**
 * Your Solution object will be instantiated and called as such:
 * Solution* obj = new Solution(nums);
 * vector<int> param_1 = obj->reset();
 * vector<int> param_2 = obj->shuffle();
 */
//Runtime: 204 ms, faster than 75.56% of C++ online submissions for Shuffle an Array.
//Memory Usage: 30.2 MB, less than 64.29% of C++ online submissions for Shuffle an Array.
```

# refer

[Fisher–Yates shuffle](https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle)
