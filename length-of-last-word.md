# length-of-last-word

[https://leetcode.com/problems/length-of-last-word/](https://leetcode.com/problems/length-of-last-word/)

# thinking

1. 基本上需要遍历一遍字符串
2. 最后可能会出现多个空格，中间也可能出现多个空格的情况
3. 遇到空格不能立刻更新 **length** ,而是使用一个标记 **signal**

```c
int lengthOfLastWord(char* s) {
    if (s == NULL) return 0;
    int length = 0, i = 0;
    bool signal = false;
    while (s[i] != '\0') {
        if (s[i] == ' ') {
            i++;
            signal = true;
            continue;
        }
        if (signal) {
            length = 0;
            length ++;
            i++;
            signal = false;
            continue;
        }
        length ++;
        i++;
    }
    
    return length;
}
```

我的答案是那样，不过忘记C语言中的可以使用 **strlen()** 来计算数组长度了。
