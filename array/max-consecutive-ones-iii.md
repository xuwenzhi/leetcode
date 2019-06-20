# max-consecutive-ones-iii

[https://leetcode.com/problems/max-consecutive-ones-iii/](https://leetcode.com/problems/max-consecutive-ones-iii/)

```
Given an array A of 0s and 1s, we may change up to K values from 0 to 1.

Return the length of the longest (contiguous) subarray that contains only 1s. 

 

Example 1:

Input: A = [1,1,1,0,0,0,1,1,1,1,0], K = 2
Output: 6
Explanation: 
[1,1,1,0,0,1,1,1,1,1,1]
Bolded numbers were flipped from 0 to 1.  The longest subarray is underlined.
Example 2:

Input: A = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], K = 3
Output: 10
Explanation: 
[0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
Bolded numbers were flipped from 0 to 1.  The longest subarray is underlined.
 

Note:

1 <= A.length <= 20000
0 <= K <= A.length
A[i] is 0 or 1 
```

# solution (priority queue)

由于可以有K个可以flip的0，这里用priority_queue存储这K个数的下标，当每次遇到0的时候，检查q.size() 是不是达到K个，如果没达到，继续push到queue中，而此时的长度 应该为 i-q.top()，然后再pop()。

### 注意点:

1. K 长度 可能 大于 A.size()

2. K 长度 可能为 0

```c++
class Solution {
public:
    int longestOnes(vector<int>& A, int K) {
        priority_queue<int,vector<int>,greater<int>> q;
        int l = A.size();
        if (K >= l) return l;
        int res=0,tmp=0;
        for (int i=0;i<A.size();i++) {
            if (A[i] == 0) {
                if (q.size() >= K) {
                    res = max(res, tmp);
                    if (K > 0) {
                        tmp = i-q.top();
                        q.pop();
                        q.push(i);
                    } else {
                        tmp = 0;
                    }
                } else {
                    q.push(i);
                    tmp++;
                }
            } else {
                tmp++;
            }
        }
        res = max(res, tmp);
        
        return res;
    }
};
//Runtime: 88 ms, faster than 7.06% of C++ online submissions for Max Consecutive Ones III.
//Memory Usage: 15.4 MB, less than 14.51% of C++ online submissions for Max Consecutive Ones III.
```

# solution (sliding window)

这个就比较好理解了，不需要维护priority_queue等结构，就能做到的方案。

```c++
class Solution {
public:
    int longestOnes(vector<int>& A, int K) {
        int res = 0, start=0, flip=0;
        for (int i=0;i<A.size();i++) {
            flip += 1 - A[i];
            while (flip > K) 
                if (A[start++] == 0) flip--;
            res = max(res, i-start+1);
        }
        
        return res;
    }
};
//Runtime: 60 ms, faster than 83.28% of C++ online submissions for Max Consecutive Ones III.
//Memory Usage: 13.6 MB, less than 92.43% of C++ online submissions for Max Consecutive Ones III.
```

# solution (sliding window) 

这也是一种求最大窗口的办法，不过这个方案不是那么好理解，最后 i 和 j 的位置也并不代表最大窗口的实际位置。

```c++
class Solution {
public:
    int longestOnes(vector<int>& A, int K) {
        int i = 0, j;
        for (j = 0; j < A.size(); ++j) {
            if (A[j] == 0) K--;
            if (K < 0 && A[i++] == 0) K++;
        }

        return j - i;
    }
};
```

# refer

[C++/Java 5 lines, sliding window](https://leetcode.com/problems/max-consecutive-ones-iii/discuss/247559/)

[Java/C++/Python Sliding Window](https://leetcode.com/problems/max-consecutive-ones-iii/discuss/247564/JavaC%2B%2BPython-Sliding-Window)
