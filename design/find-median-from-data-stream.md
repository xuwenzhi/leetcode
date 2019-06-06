# find-median-from-data-stream

[https://leetcode.com/problems/find-median-from-data-stream/](https://leetcode.com/problems/find-median-from-data-stream/)

```
Median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value. So the median is the mean of the two middle value.

For example,
[2,3,4], the median is 3

[2,3], the median is (2 + 3) / 2 = 2.5

Design a data structure that supports the following two operations:

void addNum(int num) - Add a integer number from the data stream to the data structure.
double findMedian() - Return the median of all elements so far.
 

Example:

addNum(1)
addNum(2)
findMedian() -> 1.5
addNum(3) 
findMedian() -> 2
 

Follow up:

If all integer numbers from the stream are between 0 and 100, how would you optimize it?
If 99% of all integer numbers from the stream are between 0 and 100, how would you optimize it?
```


# solution (multimap)

恭喜，神奇的通过了OJ，由于multimap是可以存储重复key值的，所以就挨个往里存储。在计算中位数时遍历到中位数的位置计算即可了。

```c++
class MedianFinder {
private:
    multimap<int,int> m;
    int t = 0;
public:
    /** initialize your data structure here. */
    MedianFinder() {
        
    }
    
    void addNum(int num) {
        m.insert({num, 1});
        t++;
    }
    
    double findMedian() {
        int n = t/2;
        multimap<int,int>::iterator it = m.begin();
        int times = t % 2 == 0 ? 1 : 0;
        for (;times<n;it++,times++);
        if (t % 2 == 1) {
            return it->first;
        }
        int sum = it->first + ((++it)->first);
        
        return (double)sum/2;
    }
};

/**
 * Your MedianFinder object will be instantiated and called as such:
 * MedianFinder* obj = new MedianFinder();
 * obj->addNum(num);
 * double param_2 = obj->findMedian();
 */
//Runtime: 1796 ms, faster than 5.01% of C++ online submissions for Find Median from Data Stream.
//Memory Usage: 45.1 MB, less than 5.80% of C++ online submissions for Find Median from Data Stream.
```

# solution (map)

这种方案是使用map，key为number value为number的个数，在计算中值时会节省一点时间，不过貌似效果不是很好。

```
class MedianFinder {
private:
    map<int,int> m;
    int t = 0;
public:
    /** initialize your data structure here. */
    MedianFinder() {
        
    }
    
    void addNum(int num) {
        m[num]++;
        t++;
    }
    
    double findMedian() {
        int n = t/2;
        map<int,int>::iterator it = m.begin();
        int times = 0;
        bool median = t % 2 == 0;
        int sum = 0;
        while (it!=m.end() && times < n) {
            if (times + it->second < n) {
                times += it->second;
                it++;
            } else if (times + it->second > n) {
                return it->first;
            } else {
                if (median) {
                    sum = it->first + ((++it)->first);
                    return (double)sum / 2;
                } else {
                    return (++it)->first;
                }
            }
        }
        return it->first;
    }
};

/**
 * Your MedianFinder object will be instantiated and called as such:
 * MedianFinder* obj = new MedianFinder();
 * obj->addNum(num);
 * double param_2 = obj->findMedian();
 */
//Runtime: 1556 ms, faster than 5.01% of C++ online submissions for Find Median from Data Stream.
//Memory Usage: 43.8 MB, less than 17.38% of C++ online submissions for Find Median from Data Stream.
```

# solution (2 heap)

这个真的就妙了，我之前的思维就一直局限在通过一个sorted数据结构解决问题，但是这种解决方案使用两个堆来实现，真是太妙了，分别建立两个堆，small（为最大堆） large（为最小堆），small存储序列左边的一部分，large存储序列右边的一部分
    
假如序列为 [1,2,3]，那么在small和large中的存储形式如下，而且如果序列为奇数，保证small的size 比 large 大1，当取中位数时直接返回 small.top()，就完事了。

    small            large
      2                3
    /
   1   


```c++
class MedianFinder {
private:
    priority_queue<int> small; // small为最大堆
    priority_queue<int, vector<int>, greater<int>> large; // large搞为最小堆
public:
    /** initialize your data structure here. */
    MedianFinder() {
        
    }
    
    void addNum(int num) {
        if (small.empty() || small.top() > num) small.push(num);
        else large.push(num);
        
        if (large.size() > small.size()) {
            small.push(large.top());
            large.pop();
        }
        
        if (small.size() > large.size() + 1) {
            large.push(small.top());
            small.pop();
        }
    }
    
    double findMedian() {
        return small.size() > large.size() 
            ? small.top() 
            : (double)(small.top()+large.top()) / 2;
    }
};

/**
 * Your MedianFinder object will be instantiated and called as such:
 * MedianFinder* obj = new MedianFinder();
 * obj->addNum(num);
 * double param_2 = obj->findMedian();
 */
//Runtime: 164 ms, faster than 82.99% of C++ online submissions for Find Median from Data Stream.
//Memory Usage: 42.6 MB, less than 56.28% of C++ online submissions for Find Median from Data Stream.
```

# refer

[My-C++-priority_queue-based-solution-(140-ms)](https://leetcode.com/problems/find-median-from-data-stream/discuss/74163/)