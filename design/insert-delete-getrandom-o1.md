# insert-delete-getrandom-o1

[https://leetcode.com/problems/insert-delete-getrandom-o1/](https://leetcode.com/problems/insert-delete-getrandom-o1/)

```
Design a data structure that supports all following operations in average O(1) time.

insert(val): Inserts an item val to the set if not already present.
remove(val): Removes an item val from the set if present.
getRandom: Returns a random element from current set of elements. Each element must have the same probability of being returned.
Example:

// Init an empty set.
RandomizedSet randomSet = new RandomizedSet();

// Inserts 1 to the set. Returns true as 1 was inserted successfully.
randomSet.insert(1);

// Returns false as 2 does not exist in the set.
randomSet.remove(2);

// Inserts 2 to the set, returns true. Set now contains [1,2].
randomSet.insert(2);

// getRandom should return either 1 or 2 randomly.
randomSet.getRandom();

// Removes 1 from the set, returns true. Set now contains [2].
randomSet.remove(1);

// 2 was already in the set, so return false.
randomSet.insert(2);

// Since 2 is the only number in the set, getRandom always return 2.
randomSet.getRandom();
```

# solution (single hashtable)

```c++
class RandomizedSet {
public:
    /** Initialize your data structure here. */
    RandomizedSet() {
        
    }
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    bool insert(int val) {
        auto it = m.find(val);
        if (it != m.end())
            return false;
        
        m.insert({val, true});
        return true;
    }
    
    /** Removes a value from the set. Returns true if the set contained the specified element. */
    bool remove(int val) {
        auto it = m.find(val);
        if (it == m.end())
            return false;
        m.erase(it);
        
        return true;
    }
    
    /** Get a random element from the set. */
    int getRandom() {
        if (m.size() == 1) 
            return m.begin()->first; 
        int random = rand() % m.size()-1;
        auto it = m.begin();
        for (int i=0;i<=random;i++)
            it++;
        return it->first;
    }
private:
    unordered_map<int, bool> m;
};

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * RandomizedSet* obj = new RandomizedSet();
 * bool param_1 = obj->insert(val);
 * bool param_2 = obj->remove(val);
 * int param_3 = obj->getRandom();
 */
//Runtime: 76 ms, faster than 19.50% of C++ online submissions for Insert Delete GetRandom O(1).
//Memory Usage: 22.1 MB, less than 100.00% of C++ online submissions for Insert Delete GetRandom O(1).
```



# solution (HashTable + Vector)

这个方案是使用HashTable和Vector数组实现的，HashTable的key为val，value为对应Vector中的下标。

Insert情况:

1. 插入到Vector尾部
2. 插入HashTable {val, Vector.size()-1} 即可

Delete情况：

1. 将Vector尾部的元素替换到需要删除的位置 ``nums[m[val]] = last;``，以及HashTable对应的 ``m[last] = m[val]``
2. 将Vector尾部元素踢出，并且清楚HashTable ``m.erase(val)``

假如，数组中是 {1,2,3,4}，此时需要删除 2，那么数组最终会变为 {1,4,3}

```c++
class RandomizedSet {
public:
    /** Initialize your data structure here. */
    RandomizedSet() {
        
    }
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    bool insert(int val) {
        if (m.find(val) != m.end()) return false;
        
        nums.emplace_back(val);
        m.insert({val, nums.size()-1});
        
        return true;
    }
    
    /** Removes a value from the set. Returns true if the set contained the specified element. */
    bool remove(int val) {
        if (m.find(val) == m.end()) return false;
        
        int last = nums.back();
        // move last element to delete position
        m[last] = m[val];
        nums[m[val]] = last;
        
        // delete origin value
        nums.pop_back();
        m.erase(val);
        
        return true;
    }
    
    /** Get a random element from the set. */
    int getRandom() {
        return nums[rand() % nums.size()];
    }
private:
    vector<int> nums;
    unordered_map<int, int> m;
};

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * RandomizedSet* obj = new RandomizedSet();
 * bool param_1 = obj->insert(val);
 * bool param_2 = obj->remove(val);
 * int param_3 = obj->getRandom();
 */
//Runtime: 68 ms, faster than 24.02% of C++ online submissions for Insert Delete GetRandom O(1).
//Memory Usage: 22.2 MB, less than 84.62% of C++ online submissions for Insert Delete GetRandom O(1).
```

# refer

[AC C++ Solution. Unordered_map + Vector](https://leetcode.com/problems/insert-delete-getrandom-o1/discuss/85422/AC-C%2B%2B-Solution.-Unordered_map-%2B-Vector)