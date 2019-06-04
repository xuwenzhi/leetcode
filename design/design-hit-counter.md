# design-hit-counter

[https://leetcode.com/problems/design-hit-counter/](https://leetcode.com/problems/design-hit-counter/)

```
Design a hit counter which counts the number of hits received in the past 5 minutes.

Each function accepts a timestamp parameter (in seconds granularity) and you may assume that calls are being made to the system in chronological order (ie, the timestamp is monotonically increasing). You may assume that the earliest timestamp starts at 1.

It is possible that several hits arrive roughly at the same time.

Example:

HitCounter counter = new HitCounter();

// hit at timestamp 1.
counter.hit(1);

// hit at timestamp 2.
counter.hit(2);

// hit at timestamp 3.
counter.hit(3);

// get hits at timestamp 4, should return 3.
counter.getHits(4);

// hit at timestamp 300.
counter.hit(300);

// get hits at timestamp 300, should return 4.
counter.getHits(300);

// get hits at timestamp 301, should return 3.
counter.getHits(301); 
Follow up:
What if the number of hits per second could be very large? Does your design scale?
```

# solution (hashtable)

使用hashtable存储时间戳以及Hit的数量，每次执行 **getHits()** 时遍历hashtable，如果时间在300s内则执行增加即可。

缺点是，如果时间戳分布较大，遍历hashtable会比较占用时间。

```c++
class HitCounter {
private:
    unordered_map<int,int> m;
public:
    /** Initialize your data structure here. */
    HitCounter() {
        
    }
    
    /** Record a hit.
        @param timestamp - The current timestamp (in seconds granularity). */
    void hit(int timestamp) {
        m[timestamp]++;
    }
    
    /** Return the number of hits in the past 5 minutes.
        @param timestamp - The current timestamp (in seconds granularity). */
    int getHits(int timestamp) {
        int res = 0;
        for (auto i:m) {
            if (timestamp - i.first < 300)
                res += i.second;
        }
        
        return res;
    }
};

/**
 * Your HitCounter object will be instantiated and called as such:
 * HitCounter* obj = new HitCounter();
 * obj->hit(timestamp);
 * int param_2 = obj->getHits(timestamp);
 */
//Runtime: 4 ms, faster than 91.17% of C++ online submissions for Design Hit Counter.
//Memory Usage: 9.4 MB, less than 19.93% of C++ online submissions for Design Hit Counter.
```

