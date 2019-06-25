# design-hashset

[https://leetcode.com/problems/design-hashset/](https://leetcode.com/problems/design-hashset/)

```
Design a HashSet without using any built-in hash table libraries.

To be specific, your design should include these functions:

add(value): Insert a value into the HashSet. 
contains(value) : Return whether the value exists in the HashSet or not.
remove(value): Remove a value in the HashSet. If the value does not exist in the HashSet, do nothing.

Example:

MyHashSet hashSet = new MyHashSet();
hashSet.add(1);         
hashSet.add(2);         
hashSet.contains(1);    // returns true
hashSet.contains(3);    // returns false (not found)
hashSet.add(2);          
hashSet.contains(2);    // returns true
hashSet.remove(2);          
hashSet.contains(2);    // returns false (already removed)

Note:

All values will be in the range of [0, 1000000].
The number of operations will be in the range of [1, 10000].
Please do not use the built-in HashSet library.
```

# solution

这种方案是以hashmap的方式实现的，只是没有value而已，使用拉链法来解决。

Note:当然还有更加暴力的，直接开辟1000000个空间即可了。

```c++
class ListNodes {
public:
    int key;
    ListNodes *next;
    ListNodes(int k) : key(k), next(NULL) {}
};
class MyHashSet {
private:
    vector<ListNodes*> v;
public:
    /** Initialize your data structure here. */
    MyHashSet() {
        v.resize(10000, nullptr);
    }
    
    int hash(int key) {
        return key % 10000;
    }
    
    void add(int key) {
        int hkey = hash(key);
        ListNodes* p = v[hkey];
        while (p) {
            if (p->key == key) {  
                return;
            }
            p = p->next;
        }
        
        ListNodes* node = new ListNodes(key);
        node->next = v[hkey];
        v[hkey] = node;
    }
    
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
    
    /** Returns true if this set contains the specified element */
    bool contains(int key) {
        int hkey = hash(key);
        ListNodes* p = v[hkey];
        while (p) {
            if (p->key == key) {
                return true;
            }
            p = p->next;
        }
        
        return false;
    }
};

/**
 * Your MyHashSet object will be instantiated and called as such:
 * MyHashSet* obj = new MyHashSet();
 * obj->add(key);
 * obj->remove(key);
 * bool param_3 = obj->contains(key);
 */
//Runtime: 100 ms, faster than 83.67% of C++ online submissions for Design HashSet.
//Memory Usage: 39.2 MB, less than 67.54% of C++ online submissions for Design HashSet.
```