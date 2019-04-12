# implement-strstr

[https://leetcode.com/problems/implement-strstr/](https://leetcode.com/problems/implement-strstr/)

# thinking

1. 最基本就是暴力匹配了
2. 当然已知的最优解就是大学数据结构课上学习的**KMP了**
3. 我的实现不是完全的KMP，算是简单版**KMP**

```c
/** 最坏 O(mn)
 * 例如 在 0000000000000000001 中查找 01
 */
int strStr(char* haystack, char* needle) {
    if (needle == NULL) return -1;
    if (haystack[0] == '\0' &&  needle[0] == '\0') return 0;
    int i = 0, j = 0, k = 0;
    int signal = false;
    for (i = 0; haystack[i] != '\0'; i++) {
        signal = false;
        k = 0;
        for (j = 0; true; j++) {
            if (needle[j] == '\0') {
                return i;
            }
            if (haystack[i+k] == '\0') {
                return -1;
            }

            if (haystack[i + k] != needle[j]) {
                break;
            }
			// 简单的KMP，争取减少循环次数
            if (!signal && haystack[i] == haystack[i+k]) {
                i += k;
                signal = true;
            }
            k ++;
            printf("%d\n", i);
        }
    }

    return -1;
}
```
