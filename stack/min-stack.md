# min-stack

[https://leetcode.com/problems/min-stack/](https://leetcode.com/problems/min-stack/)

```
Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

push(x) -- Push element x onto stack.
pop() -- Removes the element on top of the stack.
top() -- Get the top element.
getMin() -- Retrieve the minimum element in the stack.
Example:

MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin();   --> Returns -3.
minStack.pop();
minStack.top();      --> Returns 0.
minStack.getMin();   --> Returns -2.
```

# thinking

这种设计题一般解决方案都还挺多的，经典一点的解决方案可以看[http://blog.jobbole.com/106940/](http://blog.jobbole.com/106940/)这篇文章。不过我是通过一个vector+stack实现的，文章中是使用两个stack实现。不过思路是同样的。

使用vector存储真实的数据，stack用于存储对应数据位置时的最小值的index（并不是一定要存储index，其实也可以直接存储最小值）。

另外还有一些其他的解决方案，比如

[Share my Java solution with ONLY ONE stack](https://leetcode.com/problems/min-stack/discuss/49031/) 这个还真是挺屌的.

[Clean 6ms Java Solution](https://leetcode.com/problems/min-stack/discuss/49010/Clean-6ms-Java-solution) 这个是维护一个链表，然后链表的节点中会保存当时情况下的min.

# solution (vector + stack)

![http://jbcdn2.b0.upaiyun.com/2016/10/a835841ba894e06ab62623aeee04278a.jpg](http://jbcdn2.b0.upaiyun.com/2016/10/a835841ba894e06ab62623aeee04278a.jpg)

<center>图片来源[http://blog.jobbole.com/106940/](http://blog.jobbole.com/106940/)</center>

```
class MinStack {
private:
    vector<int> vec{};
    stack<int> minIndex{};
public:
    /** initialize your data structure here. */
    MinStack() {

    }

    void push(int x) {
        this->vec.push_back(x);
        if (this->minIndex.empty()) {
            this->minIndex.push(0);
        } else {
            if (this->vec[this->minIndex.top()] >= x) {
                this->minIndex.push(this->vec.size()-1);
            }
        }
    }

    void pop() {
        if (this->vec.size()-1 == this->minIndex.top()) this->minIndex.pop();
        this->vec.pop_back();
    }

    int top() {
        return this->vec.back();
    }

    int getMin() {
        return this->vec[this->minIndex.top()];
    }
};
/**
 * Your MinStack object will be instantiated and called as such:
 * MinStack* obj = new MinStack();
 * obj->push(x);
 * obj->pop();
 * int param_3 = obj->top();
 * int param_4 = obj->getMin();
 */
//Runtime: 36 ms, faster than 84.42% of C++ online submissions for Min Stack.
//Memory Usage: 16.9 MB, less than 79.57% of C++ online submissions for Min Stack.
```
