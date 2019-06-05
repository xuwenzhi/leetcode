# unique-email-addresses

[https://leetcode.com/problems/unique-email-addresses/](https://leetcode.com/problems/unique-email-addresses/)

```
Every email consists of a local name and a domain name, separated by the @ sign.

For example, in alice@leetcode.com, alice is the local name, and leetcode.com is the domain name.

Besides lowercase letters, these emails may contain '.'s or '+'s.

If you add periods ('.') between some characters in the local name part of an email address, mail sent there will be forwarded to the same address without dots in the local name.  For example, "alice.z@leetcode.com" and "alicez@leetcode.com" forward to the same email address.  (Note that this rule does not apply for domain names.)

If you add a plus ('+') in the local name, everything after the first plus sign will be ignored. This allows certain emails to be filtered, for example m.y+name@email.com will be forwarded to my@email.com.  (Again, this rule does not apply for domain names.)

It is possible to use both of these rules at the same time.

Given a list of emails, we send one email to each address in the list.  How many different addresses actually receive mails? 

 

Example 1:

Input: ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
Output: 2
Explanation: "testemail@leetcode.com" and "testemail@lee.tcode.com" actually receive mails
 

Note:

1 <= emails[i].length <= 100
1 <= emails.length <= 100
Each emails[i] contains exactly one '@' character.
All local and domain names are non-empty.
Local names do not start with a '+' character.
```

# solution (regular)

这题需要注意的是 **.** 和 **+** 也有可能出现在 @ 之后，所以只需要记住这一点，然后把正常的 email 写入hashtable就可以了，最后返回 hashtable 的size.

```c++
class Solution {
public:
    int numUniqueEmails(vector<string>& emails) {
        unordered_map<string,bool> m;

        for (auto email : emails) {
            string mail = "";
            bool pass = false;
            for (int i=0;i<email.size();++i) {
                if (email[i] == '.' && !pass) continue;
                if (email[i] == '+' && !pass) {
                    while (email[i] != '@') {
                        i++;
                    }
                }
                if (email[i] == '@') pass = true;
                mail+=email[i];
            }
            m[mail] = true;
        }
        
        return m.size();
    }
};
//Runtime: 36 ms, faster than 78.43% of C++ online submissions for Unique Email Addresses.
//Memory Usage: 13.4 MB, less than 55.82% of C++ online submissions for Unique Email Addresses.
```