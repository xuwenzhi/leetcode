# robot-bounded-in-circle

[https://leetcode.com/problems/robot-bounded-in-circle/](https://leetcode.com/problems/robot-bounded-in-circle/)

```
On an infinite plane, a robot initially stands at (0, 0) and faces north.  The robot can receive one of three instructions:

"G": go straight 1 unit;
"L": turn 90 degrees to the left;
"R": turn 90 degress to the right.
The robot performs the instructions given in order, and repeats them forever.

Return true if and only if there exists a circle in the plane such that the robot never leaves the circle.



Example 1:

Input: "GGLLGG"
Output: true
Explanation:
The robot moves from (0,0) to (0,2), turns 180 degrees, and then returns to (0,0).
When repeating these instructions, the robot remains in the circle of radius 2 centered at the origin.
Example 2:

Input: "GG"
Output: false
Explanation:
The robot moves north indefinetely.
Example 3:

Input: "GL"
Output: true
Explanation:
The robot moves from (0, 0) -> (0, 1) -> (-1, 1) -> (-1, 0) -> (0, 0) -> ...


Note:

1 <= instructions.length <= 100
instructions[i] is in {'G', 'L', 'R'}
```

# solution

这个题主要判断机器人做机械式的运动，看是否能回到原点，而机械式的运动呢也是有规律的，实际上最多有4次如果能回到原点证明就能回到原点。

```c++
// O(n) Runtime, O(1) Space.
class Solution {
public:
    // direct 1:right 2:down 3:left 4:up
    bool isRobotBounded(string instructions) {
        int direct = 1;
        int x=0,y=0;
        int l = instructions.size();

        for(int i=0;i<4*l;i++) {
            if (instructions[i%l] == 'G') {
                switch (direct) {
                    case 1:
                        x += 1;
                        break;
                    case 2:
                        y -= 1;
                        break;
                    case 3:
                        x -= 1;
                        break;
                    case 4:
                        y += 1;
                        break;
                }
            } else if (instructions[i%l] == 'L') {
                switch (direct) {
                    case 1:
                        direct = 4;
                        break;
                    case 2:
                        direct = 1;
                        break;
                    case 3:
                        direct = 2;
                        break;
                    case 4:
                        direct = 3;
                        break;
                }
            } else if (instructions[i%l] == 'R') {
                switch (direct) {
                    case 1:
                        direct = 2;
                        break;
                    case 2:
                        direct = 3;
                        break;
                    case 3:
                        direct = 4;
                        break;
                    case 4:
                        direct = 1;
                        break;
                }
            }
        }

        if (x == 0 && y == 0) {
            return true;
        }

        return false;
    }
};
```
