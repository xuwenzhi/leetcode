# count-primes

[https://leetcode.com/problems/count-primes/](https://leetcode.com/problems/count-primes/)

```
Count the number of prime numbers less than a non-negative number, n.

Example:

Input: 10
Output: 4
Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
```

# thinking

计算某个正数前有多少个素数，根据题目提示是有个算法叫做[Sieve of Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes),用一张图解释

![https://leetcode.com/static/images/solutions/Sieve_of_Eratosthenes_animation.gif](https://leetcode.com/static/images/solutions/Sieve_of_Eratosthenes_animation.gif)

# solution

```c++
class Solution {
public:
    vector<bool> getPrimes(int n){
        // the indic is true number.
        vector<bool> isPrimes(n+1, true);
        isPrimes[0] = isPrimes[1] = 0;
        for(int j=2;j<=n;++j)
            if(isPrimes[j]==true){
                for(int m=2;j*m<=n;++m)
                    isPrimes[j*m] = false;
            }

        return isPrimes;
    }

    int countPrimes(int n) {
        if (n <= 2) {
            return 0;
        }

        vector<bool> primes = getPrimes(n);
        return accumulate(primes.begin(), primes.end()-1, 0);
    }
};
//Runtime: 112 ms, faster than 31.72% of C++ online submissions for Count Primes.
//Memory Usage: 8.5 MB, less than 77.15% of C++ online submissions for Count Primes.
```
