# evaluate-reverse-polish-notation

[https://leetcode.com/problems/evaluate-reverse-polish-notation/](https://leetcode.com/problems/evaluate-reverse-polish-notation/)

```
Evaluate the value of an arithmetic expression in Reverse Polish Notation.

Valid operators are +, -, *, /. Each operand may be an integer or another expression.

Note:

Division between two integers should truncate toward zero.
The given RPN expression is always valid. That means the expression would always evaluate to a result and there won't be any divide by zero operation.
Example 1:

Input: ["2", "1", "+", "3", "*"]
Output: 9
Explanation: ((2 + 1) * 3) = 9
Example 2:

Input: ["4", "13", "5", "/", "+"]
Output: 6
Explanation: (4 + (13 / 5)) = 6
Example 3:

Input: ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]
Output: 22
Explanation:
  ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
= ((10 * (6 / (12 * -11))) + 17) + 5
= ((10 * (6 / -132)) + 17) + 5
= ((10 * 0) + 17) + 5
= (0 + 17) + 5
= 17 + 5
= 22
```

# thinking

逆波兰式或者叫后置表达式，一种表示表达式的方法，所以解决方法也很简单.

1. 遇到数字就**push**到栈中

2. 遇到运算符，就**pop**两次，然后计算这两个值的结果，再**push**到栈中

3. 最后的结果就是栈顶元素

# solution

```
// O(n) Runtime, O(n) Space.
class Solution {
public:
    bool isInteger(string s) {
        if (s == "+" || s == "-" || s == "*" || s == "/") return false;
        return true;
    }

    int evalRPN(vector<string>& tokens) {
        int len = tokens.size(), current = 0;
        stack<int> s{};
        while (current < len) {
            if (isInteger(tokens[current])) {
                s.push(stoi(tokens[current]));
            } else {
                int exp2 = s.top();s.pop();
                int exp1 = s.top();s.pop();
                int result = 0;
                if (tokens[current] == "+") {
                    result = exp1 + exp2;
                } else if (tokens[current] == "-") {
                    result = exp1 - exp2;
                } else if (tokens[current] == "*") {
                    result = exp1 * exp2;
                } else {
                    result = exp1 / exp2;
                }
                s.push(result);
            }
            current++;
        }

        return s.top();
    }
};
//Runtime: 16 ms, faster than 92.54% of C++ online submissions for Evaluate Reverse Polish Notation.
//Memory Usage: 11.4 MB, less than 78.71% of C++ online submissions for Evaluate Reverse Polish Notation.
```
