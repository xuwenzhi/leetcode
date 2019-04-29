# jewels-and-stones

[https://leetcode.com/problems/jewels-and-stones/](https://leetcode.com/problems/jewels-and-stones/)

```
You're given strings J representing the types of stones that are jewels, and S representing the stones you have.  Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.

The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive, so "a" is considered a different type of stone from "A".

Example 1:

Input: J = "aA", S = "aAAbbbb"
Output: 3
Example 2:

Input: J = "z", S = "ZZ"
Output: 0
Note:

S and J will consist of letters and have length at most 50.
The characters in J are distinct.
```

# solution

这个题就是在考察Hash table，所以把**J**中存在的jewels记录到HashTable，然后遍历S，判断HashTable中是否存在即可了。

```c++
// O(m+n) Runtime, O(m) Space.
class Solution {
public:
    int numJewelsInStones(string J, string S) {
        if (J == "") return 0;
        unordered_map<int, int> map{};

        for (int i=0;i<J.size();i++) {
            if (map.count(J[i]-'A')) {
                map[J[i]-'A']++;
            } else {
                map.insert(std::make_pair(J[i]-'A', 1));
            }
        }

        int res = 0;
        for (int i=0;i<S.size();i++) {
            if (map.count(S[i] - 'A')) res += 1;
        }

        return res;
    }
};
//Runtime: 8 ms, faster than 54.82% of C++ online submissions for Jewels and Stones.
//Memory Usage: 8.6 MB, less than 98.47% of C++ online submissions for Jewels and Stones.
```
