# majority-element-ii

[]()

# thinking

这个是[[Easy]majority-element - 主要元素](https://github.com/xuwenzhi/leetcode/blob/master/array/majority-element.md)的第二版，上题中有一个摩尔投票算法是令人印象深刻的，不过如何应用这个算法呢？因为本题是找到所有元素个数超过 n/3 个数量的元素，所以这个元素个数有可能为1个有可能为2个，嗯，得好好想想~

# solution (摩尔投票)

这个题的相比于原始的摩尔投票，是增加了一个元素，又因为此题的结果最多是2个，又又因为是想找到超过n/3个数量的元素，所以拿两个变量表示当前的两个数m1、m2，用两个变量表示这两个变量出现的次数c1、c2，如果与m1相等则c1++,如果与m2相等则c2++,如果都不相等，则c1-- && c2--。这一组就消掉了，最后得到的m1和m2，则是有可能的两个值，然后再遍历一遍数组统计真实m1和m2的数量，然后再和nums.size()/3 比较即可了.

```c++
class Solution {
public:
    vector<int> majorityElement(vector<int>& nums) {
        int m1=0,c1 = 0,m2=0,c2 = 0;
        int l = nums.size();
        vector<int> res{};
        for (int i=0;i<l;i++) {
            if (m1 == nums[i]) {
                c1++;
                continue;
            }
            if (m2 == nums[i]) {
                c2++;
                continue;
            }
            if (c1 == 0) {
                m1 = nums[i];
                c1++;
                continue;
            }
            if (c2 == 0) {
                cout<<nums[i]<<endl;
                m2 = nums[i];
                c2++;
                continue;
            }
            c1--;
            c2--;
        }

        c1 = c2 = 0;
        for (int i=0;i<l;i++) {
            if (nums[i] == m1) {
                c1++;
            } else if (nums[i] == m2) {
                c2++;
            }
        }
        if (c1 > (double)l/3) res.push_back(m1);
        if (c2 > (double)l/3) res.push_back(m2);

        return res;
    }
};
//Runtime: 16 ms, faster than 88.10% of C++ online submissions for Majority Element II.
//Memory Usage: 10.6 MB, less than 79.46% of C++ online submissions for Majority Element II.
```

# solution (hash table)

而题目还有一个要求就是，时间复杂度是 O(n), 空间复杂度是 O(1)，所以Hashtable的方式其实是不可行的，不过还是写了一版，当然速度没有那么高~

```c++
class Solution {
public:
    vector<int> majorityElement(vector<int>& nums) {
        unordered_map<int,int> map{};
        int l = nums.size();
        for (int i=0;i<l;i++) {
            if (map.count(nums[i])) map[nums[i]]++;
            else map[nums[i]]=1;
        }

        vector<int> res{};
        int threePartLen = l/3;
        for (int i=0;i<l;i++) {
            if (map[nums[i]] > threePartLen) {
                res.push_back(nums[i]);
                map[nums[i]] = 0;
            }
        }

        return res;
    }
};
//Runtime: 20 ms, faster than 32.13% of C++ online submissions for Majority Element II.
//Memory Usage: 10.9 MB, less than 5.36% of C++ online submissions for Majority Element II.
```
