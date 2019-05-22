# lru-cache

[https://leetcode.com/problems/lru-cache/](https://leetcode.com/problems/lru-cache/)

```
Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.

get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.

Follow up:
Could you do both operations in O(1) time complexity?

Example:

LRUCache cache = new LRUCache( 2 /* capacity */ );

cache.put(1, 1);
cache.put(2, 2);
cache.get(1);       // returns 1
cache.put(3, 3);    // evicts key 2
cache.get(2);       // returns -1 (not found)
cache.put(4, 4);    // evicts key 1
cache.get(1);       // returns -1 (not found)
cache.get(3);       // returns 3
cache.get(4);       // returns 4
```


# solution 

使用一个**list<pair<int,int>>**和一个**unordered_map<int, list<pair<int,int>>::iterator>** 解决，特别注意的是map的value是list的一个迭代器。

## get时

1. 判断map中是否存在**key**

2. 如不存在直接返回-1

3. 如果存在，可以直接拿到此key对应list中的迭代器，进而也可以拿到 **pair<int,int>** 组合，然后根据LRU原理，使用list内置函数 **splice** 来将此pair移动到list首位（由于list是双向链表，在使用splice操作的时间复杂度为O(1)）。最后返回迭代器所对应的value即可了。

## put时

1. 判断map中是否存在**key**

2. 如存在，list干掉此处的pair，并且新搞出来一对pair，插入到list的首位（为什么要干掉pair，再生成pair，因为两个pair虽然key一致，但是value不同）

3. 因为还有**capacity**的限制，如果此时的 **list.size() > capacity** 的话，还需要干掉list的尾部和map中对应的k-v。


```c++
class LRUCache {
private:
    list<pair<int,int>> l;
    unordered_map<int,list<pair<int,int>>::iterator> m;
    int _capacity = 0;
public:
    LRUCache(int capacity) {
        _capacity = capacity;
    }

    int get(int key) {
        auto it = m.find(key);
        if (it == m.end()) return -1;

        l.splice(l.begin(), l, it->second);

        return it->second->second;
    }
    
    void put(int key, int value) {
        
        auto it = m.find(key);
        if (it != m.end()) l.erase(it->second);
        
        l.push_front(make_pair(key, value));
        m[key] = l.begin();
        if (l.size() > _capacity) {
            int k = l.rbegin()->first;
            l.pop_back();
            m.erase(k);
        }
    }
};

/**
 * Your LRUCache object will be instantiated and called as such:
 * LRUCache* obj = new LRUCache(capacity);
 * int param_1 = obj->get(key);
 * obj->put(key,value);
 */
 //Runtime: 108 ms, faster than 95.88% of C++ online submissions for LRU Cache.
//Memory Usage: 39.4 MB, less than 52.11% of C++ online submissions for LRU Cache.
```