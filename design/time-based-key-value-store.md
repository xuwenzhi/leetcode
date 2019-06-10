# time-based-key-value-store

[https://leetcode.com/problems/time-based-key-value-store/](https://leetcode.com/problems/time-based-key-value-store/)

```
Create a timebased key-value store class TimeMap, that supports two operations.

1. set(string key, string value, int timestamp)

Stores the key and value, along with the given timestamp.
2. get(string key, int timestamp)

Returns a value such that set(key, value, timestamp_prev) was called previously, with timestamp_prev <= timestamp.
If there are multiple such values, it returns the one with the largest timestamp_prev.
If there are no values, it returns the empty string ("").
 

Example 1:

Input: inputs = ["TimeMap","set","get","get","set","get","get"], inputs = [[],["foo","bar",1],["foo",1],["foo",3],["foo","bar2",4],["foo",4],["foo",5]]
Output: [null,null,"bar","bar",null,"bar2","bar2"]
Explanation:   
TimeMap kv;   
kv.set("foo", "bar", 1); // store the key "foo" and value "bar" along with timestamp = 1   
kv.get("foo", 1);  // output "bar"   
kv.get("foo", 3); // output "bar" since there is no value corresponding to foo at timestamp 3 and timestamp 2, then the only value is at timestamp 1 ie "bar"   
kv.set("foo", "bar2", 4);   
kv.get("foo", 4); // output "bar2"   
kv.get("foo", 5); //output "bar2"   

Example 2:

Input: inputs = ["TimeMap","set","set","get","get","get","get","get"], inputs = [[],["love","high",10],["love","low",20],["love",5],["love",10],["love",15],["love",20],["love",25]]
Output: [null,null,null,"","high","high","low","low"]
 

Note:

All key/value strings are lowercase.
All key/value strings have length in the range [1, 100]
The timestamps for all TimeMap.set operations are strictly increasing.
1 <= timestamp <= 10^7
TimeMap.set and TimeMap.get functions will be called a total of 120000 times (combined) per test case.
```

# solution (2 pointer)

![https://github.com/xuwenzhi/leetcode/raw/master/images/time-based-key-value-store.jpg](https://github.com/xuwenzhi/leetcode/raw/master/images/time-based-key-value-store.jpg)

存储按照这样的方式存储，在查找时，根据hashtable快速定位到对应的vector，由于我们在插入数据的时候，使用emplace_back()将新增的组添加到对应的timestamp位置处，所以是按照timestamp排序的，这时按照二分查找即可了。

进行二分查找时，这里的条件是 **l < r - 1** ，最后结果会在 r 或者 l 的位置，最后先进行判断r的位置，满足就返回，否则返回l的位置。

```c++
class TimeMap {
private:
    unordered_map<string,vector<pair<int,string>>> umap;
public:
    /** Initialize your data structure here. */
    TimeMap() {
        
    }
    
    void set(string key, string value, int timestamp) {
        umap[key].emplace_back(timestamp, value);
    }
    
    string get(string key, int timestamp) {
        if (!umap.count(key)) return "";
        // 如果当前查找的时间戳已经小于第一个元素组，无结果
        if (timestamp < umap[key][0].first) return "";
        int n = umap[key].size();
        int l = 0, r = n - 1;
        while (l < r - 1) {
            int m = (l + r) / 2;
            if (umap[key][m].first <= timestamp) l = m;
            else
                r = m - 1;
        }
        if (umap[key][r].first <= timestamp) 
            return umap[key][r].second;
        return umap[key][l].second;
    }
};

/**
 * Your TimeMap object will be instantiated and called as such:
 * TimeMap* obj = new TimeMap();
 * obj->set(key,value,timestamp);
 * string param_2 = obj->get(key,timestamp);
 */
//Runtime: 420 ms, faster than 68.82% of C++ online submissions for Time Based Key-Value Store.
//Memory Usage: 134.4 MB, less than 87.08% of C++ online submissions for Time Based Key-Value Store.
```

# solution (hashtable + map) 

这种是Hashtable+map的方式，和上面的相比是把vector改为map，也就是把vector的线性结构改为树形结构，本质上两者是一样的，

```c++
// Author: Huahua, running time: 200 ms
class TimeMap {
public:
  /** Initialize your data structure here. */
  TimeMap() {}
 
  void set(string key, string value, int timestamp) {
    s_[key].emplace(timestamp, std::move(value));
  }
 
  string get(string key, int timestamp) {
    auto m = s_.find(key);
    if (m == s_.end()) return "";
    auto it = m->second.upper_bound(timestamp);
    // 没有比要查找的时间戳小的，比如map中的timestamp[2,3,4]，现在要查找1，那么就直接返回空
    if (it == begin(m->second)) return "";
    // 这里就直接返回it的前一个元素即可
    return prev(it)->second;
  }
private:
  unordered_map<string, map<int, string>> s_; 
};

```

# refer

[https://zhanghuimeng.github.io/post/leetcode-981-time-based-key-value-store/](https://zhanghuimeng.github.io/post/leetcode-981-time-based-key-value-store/)

[花花酱 LeetCode 981. Time Based Key-Value Store](https://zxi.mytechroad.com/blog/hashtable/leetcode-981-time-based-key-value-store/)