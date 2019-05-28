# squares-of-a-sorted-array

[https://leetcode.com/problems/squares-of-a-sorted-array/](https://leetcode.com/problems/squares-of-a-sorted-array/)

```
Given an array of integers A sorted in non-decreasing order, return an array of the squares of each number, also in sorted non-decreasing order.

 

Example 1:

Input: [-4,-1,0,3,10]
Output: [0,1,9,16,100]
Example 2:

Input: [-7,-3,2,3,11]
Output: [4,9,9,49,121]
 

Note:

1 <= A.length <= 10000
-10000 <= A[i] <= 10000
A is sorted in non-decreasing order.
```

# solution (multiset)

使用multiset直接排好序，并且还可以存储重复的元素，稳准狠。

```c++
//O(nlogn) Runtime, O(n) Space.
class Solution {
public:
    vector<int> sortedSquares(vector<int>& A) {
        multiset<int> s;
        for (auto i:A) {
            s.insert(i*i);
        }
        
        vector<int> res;
        set<int>::iterator it = s.begin();
        for (;it!=s.end();++it) {
            res.push_back(*it);
        }
        
        return res;
    }
};
//Runtime: 128 ms, faster than 24.42% of C++ online submissions for Squares of a Sorted Array.
//Memory Usage: 23.4 MB, less than 5.01% of C++ online submissions for Squares of a Sorted Array.
```


# solution (sort)

或者不使用multiset，还占了那么多空间，直接插入数组，然后排序没时间复杂度没两样。

```c++
class Solution {
public:
    vector<int> sortedSquares(vector<int>& A) {
        vector<int> res;
        for (auto i:A) {
            res.push_back(i*i);
        }
        
        sort(res.begin(), res.end());
        
        return res;
    }
};
//Runtime: 120 ms, faster than 52.83% of C++ online submissions for Squares of a Sorted Array.
//Memory Usage: 14.7 MB, less than 26.83% of C++ online submissions for Squares of a Sorted Array.
```

# solution (2 pointer)

如果整个序列都是正数和0，那么只需要从头遍历到尾计算结果即可；如果整个序列都是负数，那么从尾遍历到头部计算结果即可；如果整个序列由正负数和0都存在，那么找到正负数分割点，然后向两边扩散即可，是一种二分的解法。

```c++
// O(n) Runtime, O(1) Space.
class Solution {
public:
    vector<int> sortedSquares(vector<int>& A) {
        vector<int> res;
        
        int l = A.size();
        if (l == 0) return res;
        
        int left=-1, right=-1;
        for (int i=1;i<l;i++) {
            if (A[i] * A[i-1] <= 0) {
                left = i-1;
                right = i;
            }
        }
        vector<int>::iterator it;
        vector<int>::reverse_iterator rit;
        if (left == right) {
            if (A[0] >= 0) {
                it = A.begin();
                for (;it<A.end();it++) {
                    res.push_back(*it * *it);
                }
                return res;
            }
            if (A[l-1] < 0) {
                rit = A.rbegin();
                for (;rit<A.rend();rit++) {
                    res.push_back(*rit * *rit);
                }
                return res;
            }
        }
        while (left >= 0 || right < l) {
            int a = INT_MAX, b = INT_MAX;
            if (left >= 0) {
                a = abs(A[left]);
            }
            if (right < l) {
                b = abs(A[right]);
            }
            if (a <= b) {
                res.push_back(a*a);
                left--;
            } else {
                res.push_back(b*b);
                right++;
            }
        }
        
        return res;
    }
};
//Runtime: 100 ms, faster than 95.69% of C++ online submissions for Squares of a Sorted Array.
//Memory Usage: 14.6 MB, less than 27.80% of C++ online submissions for Squares of a Sorted Array.
```


# solution (2 pointer concise)

```c++
// O(n) Runtime, O(1) Space.
class Solution {
public:
    vector<int> sortedSquares(vector<int>& A) {
        int l = A.size();
        vector<int> res(l);
        if (l == 0) return res;
        
        int i=0,j=l-1;
        int n = l-1;
        while (i<=j) {
            if (abs(A[i]) >= abs(A[j])) {
                res[n--] = A[i] * A[i];
                i++;
            } else {
                res[n--] = A[j] * A[j];
                j--;
            }
        }
        
        return res;
    }
};
//Runtime: 112 ms, faster than 63.58% of C++ online submissions for Squares of a Sorted Array.
//Memory Usage: 13.5 MB, less than 76.16% of C++ online submissions for Squares of a Sorted Array.
```