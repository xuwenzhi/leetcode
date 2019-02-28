# reverse-integer
[https://leetcode.com/problems/reverse-integer/](https://leetcode.com/problems/reverse-integer/)

##  my solution

```
/**
* First solution
* 1.convert to string
* 2.convert string to array
* 3.loop array from end to start, generate string
* 4.convert reserved string to result
* 5.if overflow return 0
* /
func reverse(x int) int {
    var y = x
	var string_number string
	var res int64
	if x < 0 {
		string_number = strconv.Itoa(-x)
	} else {
		string_number = strconv.Itoa(x)
	}
	var result string
	var string_number_arr = strings.Split(string_number, “”)
	for i := len(string_number_arr) - 1; i >= 0; i— {
		result = result + string(string_number_arr[i])
	}
	v, _ := strconv.ParseInt(result, 10, 64)
	res = int64(v)
	if res < -2147483648 || res > 2147483647 {
		return 0
	}
	if y < 0 {
		return -int(res)
	}
	return int(res)
}
/**
* Runtime: 4 ms
* Memory Usage: 2.2 MB
 */
```
/**
* Second solution
* 1.loop the integer with divided 10
* 2.directly calculate result by (res = res * 10 + remainder)
* 3.if overflow return 0
* /
func reverse(x int) int {
    var tmp_x, tmp_remainder int64
	var y = x
	var res int64
	if x < 0 {
		x = -x
	}
	tmp_x = int64(x)
	for ; tmp_x > 0; tmp_x /= 10 {
		tmp_remainder = int64(tmp_x % 10)
		res = res*10 + int64(tmp_remainder)
	}
	if res < -2147483648 || res > 2147483647 {
		return 0
	}

	if y < 0 {
		return -int(res)
	}
	return int(res)
}
/**
* Runtime: 4 ms
* Memory Usage: 2.2 MB
 */
```

# Other solution

## 这哥儿们在判断是否overflow的时候，有点nice，[原贴](https://leetcode.com/problems/reverse-integer/discuss/4060/My-accepted-15-lines-of-code-for-Java)

```
public int reverse(int x)
{
    int result = 0;
    while (x != 0)
    {
        int tail = x % 10;
        int newResult = result * 10 + tail;
        if ((newResult - tail) / 10 != result) { 
            return 0; 
        }
        result = newResult;
        x = x / 10;
    }

    return result;
}
```

重点关注下面的代码，这里在出现溢出的时候，也就是超出 [−2^31,  2^31 − 1]  这个范围的时候
```
if ((newResult - tail) / 10 != result) { 
    return 0; 
}
```
