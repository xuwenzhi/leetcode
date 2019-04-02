# longest-common-prefix

[https://leetcode.com/problems/longest-common-prefix/](https://leetcode.com/problems/longest-common-prefix/)

# thinking

1. 注意不越界就好了

```golang
func longestCommonPrefix(strs []string) string {
    if (len(strs) <= 0) {
        return ""
    }
    var common uint8
    var j, i = 0, 0
    var length = 0
    var signal = false
    for true {
        if (len(strs[i]) <= j) {
            break;
        }
        common = strs[i][j]
        for ; i < len(strs); i++ {
            if (len(strs[i]) <= j) {
                signal = true
                break;
            }
            if (common != strs[i][j]) {
                signal = true
                break
            }
        }
        
        if (signal) {
            break;
        }
        length++
        j++
        i = 0
    }
    
    return strs[0][0:length]
}
```
