# defanging-an-ip-address

[https://leetcode.com/problems/defanging-an-ip-address/](https://leetcode.com/problems/defanging-an-ip-address/)

```
Given a valid (IPv4) IP address, return a defanged version of that IP address.

A defanged IP address replaces every period "." with "[.]".

 

Example 1:

Input: address = "1.1.1.1"
Output: "1[.]1[.]1[.]1"
Example 2:

Input: address = "255.100.50.0"
Output: "255[.]100[.]50[.]0"
 

Constraints:

The given address is a valid IPv4 address.
```

# solution (concat)

```c++
class Solution {
public:
    string defangIPaddr(string address) {
        string res;
        string token;
        istringstream tokenStream(address);
        while (getline(tokenStream, token, '.')) {
            res += token + "[.]";
        }
        
        return res.substr(0, res.length()-3);
    }
};
//Runtime: 0 ms, faster than 100.00% of C++ online submissions for Defanging an IP Address.
//Memory Usage: 8.5 MB, less than 100.00% of C++ online submissions for Defanging an IP Address.
```

# solution (replace)

```c++
class Solution {
public:
    void replaceAll( string &s, const string &search, const string &replace ) {
        for( size_t pos = 0; ; pos += replace.length() ) {
            // Locate the substring to replace
            pos = s.find( search, pos );
            if( pos == string::npos ) break;
            // Replace by erasing and inserting
            s.erase( pos, search.length() );
            s.insert( pos, replace );
        }
    }
    string defangIPaddr(string address) {
        replaceAll(address, ".", "[.]");
        return address;
    }
};
//Runtime: 0 ms, faster than 100.00% of C++ online submissions for Defanging an IP Address.
//Memory Usage: 8.2 MB, less than 100.00% of C++ online submissions for Defanging an IP Address.
```