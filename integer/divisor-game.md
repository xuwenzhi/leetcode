# divisor-game

[https://leetcode.com/problems/divisor-game/](https://leetcode.com/problems/divisor-game/)

```
Alice and Bob take turns playing a game, with Alice starting first.

Initially, there is a number N on the chalkboard.  On each player's turn, that player makes a move consisting of:

Choosing any x with 0 < x < N and N % x == 0.
Replacing the number N on the chalkboard with N - x.
Also, if a player cannot make a move, they lose the game.

Return True if and only if Alice wins the game, assuming both players play optimally.



Example 1:

Input: 2
Output: true
Explanation: Alice chooses 1, and Bob has no more moves.
Example 2:

Input: 3
Output: false
Explanation: Alice chooses 1, Bob chooses 1, and Alice has no more moves.


Note:

1 <= N <= 1000
```

# thinking

好吧，参加了这期的Contest，这道题没刷出来，看到讨论之后完全懵逼，尴尬的问题，更尴尬的是还没答出来。。

对于这个问题，毕竟是个数学问题，有时候需要记住一些数学公理啊，而本题的公理就是

> 奇数的因子一定都为奇数.

# solution

```c++
class Solution {
public:
    bool divisorGame(int N) {
        return N % 2 == 0;
    }
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for Divisor Game.
//Memory Usage: 7.9 MB, less than 100.00% of C++ online submissions for Divisor Game.
```
