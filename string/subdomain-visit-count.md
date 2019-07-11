# subdomain-visit-count

[https://leetcode.com/problems/subdomain-visit-count/](https://leetcode.com/problems/subdomain-visit-count/)

```
A website domain like "discuss.leetcode.com" consists of various subdomains. At the top level, we have "com", at the next level, we have "leetcode.com", and at the lowest level, "discuss.leetcode.com". When we visit a domain like "discuss.leetcode.com", we will also visit the parent domains "leetcode.com" and "com" implicitly.

Now, call a "count-paired domain" to be a count (representing the number of visits this domain received), followed by a space, followed by the address. An example of a count-paired domain might be "9001 discuss.leetcode.com".

We are given a list cpdomains of count-paired domains. We would like a list of count-paired domains, (in the same format as the input, and in any order), that explicitly counts the number of visits to each subdomain.

Example 1:
Input: 
["9001 discuss.leetcode.com"]
Output: 
["9001 discuss.leetcode.com", "9001 leetcode.com", "9001 com"]
Explanation: 
We only have one website domain: "discuss.leetcode.com". As discussed above, the subdomain "leetcode.com" and "com" will also be visited. So they will all be visited 9001 times.

Example 2:
Input: 
["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"]
Output: 
["901 mail.com","50 yahoo.com","900 google.mail.com","5 wiki.org","5 org","1 intel.mail.com","951 com"]
Explanation: 
We will visit "google.mail.com" 900 times, "yahoo.com" 50 times, "intel.mail.com" once and "wiki.org" 5 times. For the subdomains, we will visit "mail.com" 900 + 1 = 901 times, "com" 900 + 50 + 1 = 951 times, and "org" 5 times.

Notes:

The length of cpdomains will not exceed 100. 
The length of each domain name will not exceed 100.
Each address will have either 1 or 2 "." characters.
The input count in any count-paired domain will not exceed 10000.
The answer output can be returned in any order.
```

# solution 

```c++
class Solution {
public:
    vector<string> split(const string& s, char delimiter) {
       vector<std::string> tokens;
       string token;
       istringstream tokenStream(s);
       while (std::getline(tokenStream, token, delimiter))
       {
          tokens.push_back(token);
       }
       return tokens;
    }
    
    vector<string> subdomainVisits(vector<string>& cpdomains) {
        vector<string> res;
        unordered_map<string, int> m;
        for (int i=0;i<cpdomains.size();i++) {
            vector<string> v = split(cpdomains[i], ' ');
            int counts = stoi(v[0]);
            if (m.find(v[1]) == m.end()) {
                m[v[1]] = counts;
            } else {
                m[v[1]] += counts;
            }
            int pos = v[1].find_first_of('.');
            
            while (pos != string::npos) {
                v[1] = v[1].substr(pos+1);
                if (m.find(v[1]) == m.end()) {
                    m[v[1]] = counts;
                } else {
                    m[v[1]] += counts;
                }
                pos = v[1].find_first_of('.');
            }
        }
        
        for (auto i:m) {
            res.push_back(to_string(i.second) + " " + i.first);
        }
        return res;
    }
};
//Runtime: 24 ms, faster than 43.46% of C++ online submissions for Subdomain Visit Count.
//Memory Usage: 14.2 MB, less than 16.25% of C++ online submissions for Subdomain Visit Count.
```