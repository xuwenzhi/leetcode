# score-of-parentheses

[https://leetcode.com/problems/score-of-parentheses/](https://leetcode.com/problems/score-of-parentheses/)

# thinging1

0. 见到这么括号匹配，第一想到的就是用栈这种数据结构

1. 最开始希望是将 "(" 依次入栈，然后再往右取字符串做判断

2. 但是这个比较困难的点是如何判断一组 "()"， 以及嵌套的这种情况，如图

![https://github.com/xuwenzhi/leetcode/raw/master/images/score-of-parentheses1.jpg](https://github.com/xuwenzhi/leetcode/raw/master/images/score-of-parentheses1.jpg)


# solution1

```
无
```

# thinking2

借鉴 [https://leetcode.com/problems/score-of-parentheses/discuss/141777/C%2B%2BJavaPython-O(1)-Space](https://leetcode.com/problems/score-of-parentheses/discuss/141777/C%2B%2BJavaPython-O(1)-Space) 给出了多种方案，O(n)甚至还有O(1)



综合时间和空间，下面的方案是最优的，具体思路是

1. 不论外部嵌入多少层，内部的层只关心自己到最外层有多少层，结合律可以解释这个问题

```
a * (b + c) = a * b + a * c
```

```c
// time:O(logn) space:O(1)
int scoreOfParentheses(char* S) {
    int i, l = 0, res = 0;
    for (i = 0; i < strlen(S); i++) {
        if (S[i] == '(') l++; else l--;
        if (S[i] == ')' && S[i - 1] == '(') res += 1 << l;
    }
    return res;
}
```
