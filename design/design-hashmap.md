# design-hashmap

[https://leetcode.com/problems/design-hashmap/](https://leetcode.com/problems/design-hashmap/)

```
Design a HashMap without using any built-in hash table libraries.

To be specific, your design should include these functions:

put(key, value) : Insert a (key, value) pair into the HashMap. If the value already exists in the HashMap, update the value.
get(key): Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key.
remove(key) : Remove the mapping for the value key if this map contains the mapping for the key.

Example:

MyHashMap hashMap = new MyHashMap();
hashMap.put(1, 1);          
hashMap.put(2, 2);         
hashMap.get(1);            // returns 1
hashMap.get(3);            // returns -1 (not found)
hashMap.put(2, 1);          // update the existing value
hashMap.get(2);            // returns 1 
hashMap.remove(2);          // remove the mapping for 2
hashMap.get(2);            // returns -1 (not found) 

Note:

All keys and values will be in the range of [0, 1000000].
The number of operations will be in the range of [1, 10000].
Please do not use the built-in HashMap library.
```

# thinking 

由于Hash表可能出现冲突，这里我使用拉链法来解决冲突问题。当然最核心的就是Hash函数，保证key分布均匀来保证查找效率，最开始我就使用了最简单的取模(没想到效率还挺高，主要是因为case的缘故)，由于题目中给的提示，key的范围在[0,1000000]，所以我预先开辟了10000个空间来存储。

Note:当然还有更加暴力的，直接开辟1000000个空间即可了。

# solution

```c++
class ListNodes {
public:
    int val;
    int key;
    ListNodes *next;
    ListNodes(int x, int k) : val(x), key(k), next(NULL) {}
};
class MyHashMap {
private:
    vector<ListNodes*> v;
public:
    /** Initialize your data structure here. */
    MyHashMap() {
        v.resize(10000, nullptr);
    }
    
    int hash(int key) {
        return key % 10000;
    }
    
    /** value will always be non-negative. */
    void put(int key, int value) {
        int hkey = hash(key);
        ListNodes* p = v[hkey];
        while (p) {
            if (p->key == key) {
                p->val = value;    
                return;
            }
            p = p->next;
        }
        
        ListNodes* node = new ListNodes(value, key);
        node->next = v[hkey];
        v[hkey] = node;
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    int get(int key) {
        ListNodes* p = v[hash(key)];
        
        while (p) {
            if (p->key == key) {
                return p->val;
            }
            p = p->next;
        }
        
        return -1;
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    void remove(int key) {
        int hkey = hash(key);
        ListNodes* p = v[hkey];
        if (!p) return;
        if (p && p->key == key) {
            v[hkey] = p->next;
            return;
        }
        while (p->next) {
            if (p->next->key == key) {
                p->next = p->next->next;
                break;
            }
            p = p->next;
        }
    }
};

/**
 * Your MyHashMap object will be instantiated and called as such:
 * MyHashMap* obj = new MyHashMap();
 * obj->put(key,value);
 * int param_2 = obj->get(key);
 * obj->remove(key);
 */
//Runtime: 108 ms, faster than 96.55% of C++ online submissions for Design HashMap.
//Memory Usage: 44.7 MB, less than 72.02% of C++ online submissions for Design HashMap.
```

# solution 

这个方案是使用一个二维的vector来解决，通过 **resize()** 来动态开辟空间，这个前提是 case中key的范围是[0, 1000000]，不过每次动态开辟的空间也不见得会节省空间(比如有些槽就只有一个有效key，但是却开辟了1000个空间)，不过查询时利用数组的特性查询效率会更高。

```c++
class MyHashMap {
private:
    vector<vector<int>> v;
public:
    /** Initialize your data structure here. */
    MyHashMap() {
        v.resize(1000, vector<int>());
    }
    
    int hash(int key) {
        return key % 1000;
    }
    
    /** value will always be non-negative. */
    void put(int key, int value) {
        int hkey = hash(key);
        if (v[hkey].empty()) 
            v[hkey].resize(1000, -1);
        
        v[hkey][key/1000] = value;
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    int get(int key) {
        int hkey = hash(key);
        if (!v[hkey].empty()) 
            return v[hkey][key/1000];
        
        return -1;
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    void remove(int key) {
        int hkey = hash(key);
        if (!v[hkey].empty()) 
            v[hkey][key/1000] = -1;
    }
};

/**
 * Your MyHashMap object will be instantiated and called as such:
 * MyHashMap* obj = new MyHashMap();
 * obj->put(key,value);
 * int param_2 = obj->get(key);
 * obj->remove(key);
 */
//Runtime: 148 ms, faster than 45.74% of C++ online submissions for Design HashMap.
//Memory Usage: 121.6 MB, less than 35.26% of C++ online submissions for Design HashMap.
```

# refer

[[LeetCode] Design HashMap 设计HashMap](https://www.cnblogs.com/grandyang/p/9972764.html)