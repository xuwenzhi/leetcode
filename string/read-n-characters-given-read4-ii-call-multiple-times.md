# read-n-characters-given-read4-ii-call-multiple-times

[https://leetcode.com/problems/read-n-characters-given-read4-ii-call-multiple-times/](https://leetcode.com/problems/read-n-characters-given-read4-ii-call-multiple-times/)

```
Given a file and assume that you can only read the file using a given method read4, implement a method read to read n characters. Your method read may be called multiple times.

 

Method read4:

The API read4 reads 4 consecutive characters from the file, then writes those characters into the buffer array buf.

The return value is the number of actual characters read.

Note that read4() has its own file pointer, much like FILE *fp in C.

Definition of read4:

    Parameter:  char[] buf
    Returns:    int

Note: buf[] is destination not source, the results from read4 will be copied to buf[]
Below is a high level example of how read4 works:

File file("abcdefghijk"); // File is "abcdefghijk", initially file pointer (fp) points to 'a'
char[] buf = new char[4]; // Create buffer with enough space to store characters
read4(buf); // read4 returns 4. Now buf = "abcd", fp points to 'e'
read4(buf); // read4 returns 4. Now buf = "efgh", fp points to 'i'
read4(buf); // read4 returns 3. Now buf = "ijk", fp points to end of file
 

Method read:

By using the read4 method, implement the method read that reads n characters from the file and store it in the buffer array buf. Consider that you cannot manipulate the file directly.

The return value is the number of actual characters read.

Definition of read:

    Parameters:	char[] buf, int n
    Returns:	int

Note: buf[] is destination not source, you will need to write the results to buf[]
 

Example 1:

File file("abc");
Solution sol;
// Assume buf is allocated and guaranteed to have enough space for storing all characters from the file.
sol.read(buf, 1); // After calling your read method, buf should contain "a". We read a total of 1 character from the file, so return 1.
sol.read(buf, 2); // Now buf should contain "bc". We read a total of 2 characters from the file, so return 2.
sol.read(buf, 1); // We have reached the end of file, no more characters can be read. So return 0.
Example 2:

File file("abc");
Solution sol;
sol.read(buf, 4); // After calling your read method, buf should contain "abc". We read a total of 3 characters from the file, so return 3.
sol.read(buf, 1); // We have reached the end of file, no more characters can be read. So return 0.
 

Note:

Consider that you cannot manipulate the file directly, the file is only accesible for read4 but not for read.
The read function may be called multiple times.
Please remember to RESET your class variables declared in Solution, as static/class variables are persisted across multiple test cases. Please see here for more details.
You may assume the destination buffer array, buf, is guaranteed to have enough space for storing n characters.
It is guaranteed that in a given test case the same buffer buf is called by read.
```

# thinking

是[[Easy]read-n-characters-given-read4 - 使用read4读取buffer](https://github.com/xuwenzhi/leetcode/blob/master/string/read-n-characters-given-read4.md)多次调用版本，也就是这次可以调用多次，具体还是使用read4来进行读取，由于read4每次最多只能取出4个字符，在多次调用的场景下，以下面的case为例

"abc"
[1,2,1]

第一次调用时，通过read4取出4个字符，所以取到 "abc"，但是只需要一个字符，这种情况下需要返回 'a' ，而 "bc"，是我们多余取出来的，当下次调用过来的时候就不需要调用read4，而是从上一次调用中复用 "bc"， 所以第2次过来时返回 "bc"，而第3此过来时，已经没有字符可供读取，故返回 ""。这个解法还是很巧妙的。

以上面这个case为例，writePos和 readPos的变化为

```
n = 1
readPos=0, writePos=0

n = 2
readPos=1, writePos=3
readPos=2, writePos=3

n = 1
readPos=3, writePos=3 // 也就是最后一次还是会调用一次read4，只不过这时什么也没有取出来。
```

# solution 

```c++
// Forward declaration of the read4 API.
int read4(char *buf);

class Solution {
private:
    int writePos = 0, readPos = 0;
    char buff[4];
public:
    /**
     * @param buf Destination buffer
     * @param n   Number of characters to read
     * @return    The number of actual characters read
     */
    int read(char *buf, int n) {
        for (int i=0;i<n;i++) {
            if (writePos == readPos) {
                //通过read4读入到buff
                writePos = read4(buff);
                
                readPos = 0;
                // 如果read4什么也读不出来了，就直接返回
                if (writePos == 0) return i;
            }
            buf[i] = buff[readPos++];
        }
        return n;
    }
};
//Runtime: 0 ms, faster than 100.00% of C++ online submissions for Read N Characters Given Read4 II - Call multiple times.
//Memory Usage: 8.6 MB, less than 46.18% of C++ online submissions for Read N Characters Given Read4 II - Call multiple times.
```

# refer

[[LeetCode] Read N Characters Given Read4 II - Call multiple times 用Read4来读取N个字符之二 - 多次调用](https://www.cnblogs.com/grandyang/p/5181672.html)