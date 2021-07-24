# snapshot-array

[https://leetcode.com/problems/snapshot-array/](https://leetcode.com/problems/snapshot-array/)

```
Implement a SnapshotArray that supports the following interface:

SnapshotArray(int length) initializes an array-like data structure with the given length.  Initially, each element equals 0.
void set(index, val) sets the element at the given index to be equal to val.
int snap() takes a snapshot of the array and returns the snap_id: the total number of times we called snap() minus 1.
int get(index, snap_id) returns the value at the given index, at the time we took the snapshot with the given snap_id
 

Example 1:

Input: ["SnapshotArray","set","snap","set","get"]
[[3],[0,5],[],[0,6],[0,0]]
Output: [null,null,0,null,5]
Explanation: 
SnapshotArray snapshotArr = new SnapshotArray(3); // set the length to be 3
snapshotArr.set(0,5);  // Set array[0] = 5
snapshotArr.snap();  // Take a snapshot, return snap_id = 0
snapshotArr.set(0,6);
snapshotArr.get(0,0);  // Get the value of array[0] with snap_id = 0, return 5
 

Constraints:

1 <= length <= 50000
At most 50000 calls will be made to set, snap, and get.
0 <= index < length
0 <= snap_id < (the total number of times we call snap())
0 <= val <= 10^9
```

# solution

```c++
class SnapshotArray {
public:
    SnapshotArray(int length) {
        data.resize(length, 0);
    }
    
    void set(int index, int val) {
        // if no snaps just change original array
        if (snaps.size() == 0) {
            data[index] = val;
        } else {
            // Recording changes to changed_values
            changed_values.push_back({index, val});
        }
    }
    
    int snap() {
        if (snaps.size() > 0) {
            snaps.push_back(snaps[snaps.size() - 1]);
        } else {
            snaps.push_back({});
        }
        unordered_map<int, int> changes;
        for (int i = 0; i < changed_values.size(); i++) {
            snaps[snaps.size() - 1][changed_values[i].first] = changed_values[i].second;
        }
        // clear changed_values in every snap()
        changed_values.clear();
        
        return snaps.size() - 1;
    }
    
    int get(int index, int snap_id) {
        // if there is changed on this index, return changed value
        auto changes = snaps[snap_id];
        if (changes.find(index) != changes.end()) {
            return changes[index];
        }
        //otherwise return the value in this index
        return data[index];
    }
    
private:
    vector<int> data;
    vector<unordered_map<int, int>> snaps;
    vector<pair<int, int>> changed_values;
};

/**
 * Your SnapshotArray object will be instantiated and called as such:
 * SnapshotArray* obj = new SnapshotArray(length);
 * obj->set(index,val);
 * int param_2 = obj->snap();
 * int param_3 = obj->get(index,snap_id);
 */

//Runtime: 292 ms, faster than 30.66% of C++ online submissions for Snapshot Array.
//Memory Usage: 135.9 MB, less than 5.51% of C++ online submissions for Snapshot Array.
```