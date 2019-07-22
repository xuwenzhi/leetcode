# all-paths-from-source-to-target

[https://leetcode.com/problems/all-paths-from-source-to-target/](https://leetcode.com/problems/all-paths-from-source-to-target/)

```
Given a directed, acyclic graph of N nodes.  Find all possible paths from node 0 to node N-1, and return them in any order.

The graph is given as follows:  the nodes are 0, 1, ..., graph.length - 1.  graph[i] is a list of all nodes j for which the edge (i, j) exists.

Example:
Input: [[1,2], [3], [3], []] 
Output: [[0,1,3],[0,2,3]] 
Explanation: The graph looks like this:
0--->1
|    |
v    v
2--->3
There are two paths: 0 -> 1 -> 3 and 0 -> 2 -> 3.
Note:

The number of nodes in the graph will be in the range [2, 15].
You can print different paths in any order, but you should keep the order of nodes inside one path.
```

# thinking

和这道题差不多 [[Medium]keys-and-rooms - 钥匙和房间](https://github.com/xuwenzhi/leetcode/blob/master/graph/keys-and-rooms.md) 都是一类根据数组下标跳动的题目。

# solution (dfs)

```c++
class Solution {
public:
    void dfs(vector<vector<int>>& graph, int current, vector<int> &pre, vector<vector<int>>& res) {
        pre.push_back(current);
        if (current == graph.size()-1) {
            res.push_back(pre);
        } else {
            for (auto inx : graph[current]) {
                dfs(graph, inx, pre, res);
            }   
        }
        pre.pop_back();
    }
    
    vector<vector<int>> allPathsSourceTarget(vector<vector<int>>& graph) {
        vector<vector<int>> res;
        vector<int> pre;
        
        dfs(graph, 0, pre, res);
        
        return res;
    }
};
//Runtime: 68 ms, faster than 99.43% of C++ online submissions for All Paths From Source to Target.
//Memory Usage: 12.6 MB, less than 73.41% of C++ online submissions for All Paths From Source to Target.
```