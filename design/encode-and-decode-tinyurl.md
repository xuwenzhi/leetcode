# encode-and-decode-tinyurl

[https://leetcode.com/problems/encode-and-decode-tinyurl/](https://leetcode.com/problems/encode-and-decode-tinyurl/)

```
Note: This is a companion problem to the System Design problem: Design TinyURL.
TinyURL is a URL shortening service where you enter a URL such as https://leetcode.com/problems/design-tinyurl and it returns a short URL such as http://tinyurl.com/4e9iAk.

Design the encode and decode methods for the TinyURL service. There is no restriction on how your encode/decode algorithm should work. You just need to ensure that a URL can be encoded to a tiny URL and the tiny URL can be decoded to the original URL.


```

# thinking

就不采用加密字符的方式弄了，可以直接内置个map来解决或者放在数据库中也是一样的。


# solution

```c++
class Solution {
public:

    // Encodes a URL to a shortened URL.
    string encode(string longUrl) {
        m[key] = longUrl;

        return domain + to_string(key++);
    }

    // Decodes a shortened URL to its original URL.
    string decode(string shortUrl) {
        int k = stoi(shortUrl.substr(domain.length()));

        return m[k];
    }
private:
    map<int, string> m;
    string domain = "https://tinyurl.com/";
    int key = 0;
};

// Your Solution object will be instantiated and called as such:
// Solution solution;
// solution.decode(solution.encode(url));
//Runtime: 4 ms, faster than 89.59% of C++ online submissions for Encode and Decode TinyURL.
//Memory Usage: 8.2 MB, less than 100.00% of C++ online submissions for Encode and Decode TinyURL.
```
