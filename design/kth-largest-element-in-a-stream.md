# kth-largest-element-in-a-stream

[https://leetcode.com/problems/kth-largest-element-in-a-stream/](https://leetcode.com/problems/kth-largest-element-in-a-stream/)

```
Design a class to find the kth largest element in a stream. Note that it is the kth largest element in the sorted order, not the kth distinct element.

Your KthLargest class will have a constructor which accepts an integer k and an integer array nums, which contains initial elements from the stream. For each call to the method KthLargest.add, return the element representing the kth largest element in the stream.

Example:

int k = 3;
int[] arr = [4,5,8,2];
KthLargest kthLargest = new KthLargest(3, arr);
kthLargest.add(3);   // returns 4
kthLargest.add(5);   // returns 5
kthLargest.add(10);  // returns 5
kthLargest.add(9);   // returns 8
kthLargest.add(4);   // returns 8
Note:
You may assume that nums' length ≥ k-1 and k ≥ 1.
```

# solution (min heap)

```c++
class KthLargest {
private:
    priority_queue<int, vector<int>, greater<int>> q{};
    int key;
public:
    KthLargest(int k, vector<int>& nums) {
        key = k;
        for (int i=0;i<nums.size();i++) {
            q.push(nums[i]);
            if (q.size() > k) {
                q.pop();
            }
        }
    }

    int add(int val) {
        q.push(val);
        if (q.size() > key) q.pop();
        if (q.size() == key) {
            return q.top();
        }
        return -1;
    }
};

/**
 * Your KthLargest object will be instantiated and called as such:
 * KthLargest* obj = new KthLargest(k, nums);
 * int param_1 = obj->add(val);
 */
//Runtime: 40 ms, faster than 100.00% of C++ online submissions for Kth Largest Element in a Stream.
//Memory Usage: 19.4 MB, less than 78.43% of C++ online submissions for Kth Largest Element in a Stream.
 ```
