# implement-stack-using-queues

[https://leetcode.com/problems/implement-stack-using-queues/](https://leetcode.com/problems/implement-stack-using-queues/)

```
Implement the following operations of a stack using queues.

push(x) -- Push element x onto stack.
pop() -- Removes the element on top of the stack.
top() -- Get the top element.
empty() -- Return whether the stack is empty.
Example:

MyStack stack = new MyStack();

stack.push(1);
stack.push(2);
stack.top();   // returns 2
stack.pop();   // returns 2
stack.empty(); // returns false
Notes:

You must use only standard operations of a queue -- which means only push to back, peek/pop from front, size, and is empty operations are valid.
Depending on your language, queue may not be supported natively. You may simulate a queue by using a list or deque (double-ended queue), as long as you use only standard operations of a queue.
You may assume that all operations are valid (for example, no pop or top operations will be called on an empty stack).
```

# thinking

使用队列来实现栈，这个在大学的时候就有所耳闻了，不过没有实现过，嘿嘿，这次真正实现一把。解决方案就是使用两个队列，每次push数据时都往拥有数据最多的队列push，也就是始终存在一个队列有数据，而另外一个队列始终没数据的状态。这一状态当在需要pop的时候，把有数据的队列依次pop，并且push到另外一个队列中，仅留下一个元素用于返回即可。代码中使用两个变量 **q1Size** 和 **q2Size** 保存两个队列的元素个数.

# solution

```
class MyStack {
public:
    queue<int> q1{};
    queue<int> q2{};
    int q1Size = 0;
    int q2Size = 0;
    /** Initialize your data structure here. */
    MyStack() {
    };

    /** Push element x onto stack. */
    void push(int x) {
        if (this->q1Size >= this->q2Size) {
            this->q1.push(x);
            this->q1Size++;
        } else {
            this->q2.push(x);
            this->q2Size++;
        }
        //cout<<"push value:"<<x<<"size:"<<this->q1Size<<endl;
    }

    /** Removes the element on top of the stack and returns that element. */
    int pop() {
        //cout<<"pop"<<endl;
        if (this->q1Size <= 0 && this->q2Size <= 0) {
            //cout<<"size is zero"<<endl;
            return 0;
        }
        int tmp;
        if (this->q1Size >= this->q2Size) {
            //cout<<"pop from q1"<<endl;
            while (this->q1Size-- > 1) {
                tmp = q1.front();
                q1.pop();
                q2.push(tmp);
                this->q2Size++;
            }
            tmp = q1.front();
            q1.pop();
            //cout<<"q1 size:"<<this->q1Size<<endl;
            //cout<<"q2 size:"<<this->q2Size<<endl;
            return tmp;
        } else {
            cout<<"pop from q2"<<endl;
            while (this->q2Size-- > 1) {
                tmp = q2.front();
                q2.pop();
                q1.push(tmp);
                this->q1Size++;
            }
            tmp = q2.front();
            q2.pop();
            //cout<<"q2 size:"<<this->q2Size<<endl;
            //cout<<"q1 size:"<<this->q1Size<<endl;
            return tmp;
        }
    }

    /** Get the top element. */
    int top() {
        if (this->q1Size <= 0 && this->q2Size <= 0) {
            //cout<<"size is zero"<<endl;
            return 0;
        }
        if (this->q1Size >= this->q2Size)
            return this->q1.back();
        else
            return this->q2.back();
    }

    /** Returns whether the stack is empty. */
    bool empty() {
        return this->q1Size == 0 && this->q2Size == 0;
    }
};

/**
 * Your MyStack object will be instantiated and called as such:
 * MyStack* obj = new MyStack();
 * obj->push(x);
 * int param_2 = obj->pop();
 * int param_3 = obj->top();
 * bool param_4 = obj->empty();
 */
```

Runtime: 4 ms, faster than 100.00% of C++ online submissions for Implement Stack using Queues.

Memory Usage: 8.8 MB, less than 80.19% of C++ online submissions for Implement Stack using Queues.
