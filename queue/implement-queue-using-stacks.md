# implement-queue-using-stacks

[https://leetcode.com/problems/implement-queue-using-stacks/](https://leetcode.com/problems/implement-queue-using-stacks/)

```
Implement the following operations of a queue using stacks.

push(x) -- Push element x to the back of queue.
pop() -- Removes the element from in front of queue.
peek() -- Get the front element.
empty() -- Return whether the queue is empty.
Example:

MyQueue queue = new MyQueue();

queue.push(1);
queue.push(2);
queue.peek();  // returns 1
queue.pop();   // returns 1
queue.empty(); // returns false
Notes:

You must use only standard operations of a stack -- which means only push to top, peek/pop from top, size, and is empty operations are valid.
Depending on your language, stack may not be supported natively. You may simulate a stack by using a list or deque (double-ended queue), as long as you use only standard operations of a stack.
You may assume that all operations are valid (for example, no pop or peek operations will be called on an empty queue).
```

# thinking

用两个栈实现队列，一个栈s1用于接受**push**数据，而另一个栈s2用于**pop**数据，而s2可能会在下一次pop操作时为空，所以需要把s1栈的数据主动pop然后push到s2中，在解决方案中，使用**transfer()**来做这样的操作。

# solution

```
class MyQueue {
public:
    stack<int> s1;
    stack<int> s2;
    /** Initialize your data structure here. */
    MyQueue() {

    }

    /** Push element x to the back of queue. */
    void push(int x) {
        this->s1.push(x);
    }

    /** Removes the element from in front of queue and returns that element. */
    int pop() {
        transfer();
        int res = this->s2.top();
        this->s2.pop();
        return res;
    }

    void transfer() {
        if (this->s2.size() == 0) {
            while (this->s1.size() > 0) {
                int tmp = this->s1.top();
                this->s1.pop();
                this->s2.push(tmp);
            }
        }
    }

    /** Get the front element. */
    int peek() {
        transfer();
        return this->s2.top();
    }

    /** Returns whether the queue is empty. */
    bool empty() {
        return this->s1.size() == 0 && this->s2.size() == 0;
    }
};

/**
 * Your MyQueue object will be instantiated and called as such:
 * MyQueue* obj = new MyQueue();
 * obj->push(x);
 * int param_2 = obj->pop();
 * int param_3 = obj->peek();
 * bool param_4 = obj->empty();
 */
```

Runtime: 4 ms, faster than 100.00% of C++ online submissions for Implement Queue using Stacks.

Memory Usage: 8.6 MB, less than 100.00% of C++ online submissions for Implement Queue using Stacks.
