# peeking-iterator

[https://leetcode.com/problems/peeking-iterator/](https://leetcode.com/problems/peeking-iterator/)

```
Given an Iterator class interface with methods: next() and hasNext(), design and implement a PeekingIterator that support the peek() operation -- it essentially peek() at the element that will be returned by the next call to next().

Example:

Assume that the iterator is initialized to the beginning of the list: [1,2,3].

Call next() gets you 1, the first element in the list.
Now you call peek() and it returns 2, the next element. Calling next() after that still return 2.
You call next() the final time and it returns 3, the last element.
Calling hasNext() after that should return false.
Follow up: How would you extend your design to be generic and work with all types, not just integer?
```

# solution

因为要实现**peek()**，但是又不能使迭代器向后移动，所以这里使用了临时变量来解决这个问题。

```c++
// Below is the interface for Iterator, which is already defined for you.
// **DO NOT** modify the interface for Iterator.
class Iterator {
    struct Data;
	Data* data;
public:
	Iterator(const vector<int>& nums);
	Iterator(const Iterator& iter);
	virtual ~Iterator();
	// Returns the next element in the iteration.
	int next();
	// Returns true if the iteration has more elements.
	bool hasNext() const;
};


class PeekingIterator : public Iterator {
private:
    int value;
    bool flag = false;
public:
	PeekingIterator(const vector<int>& nums) : Iterator(nums) {
	    // Initialize any member here.
	    // **DO NOT** save a copy of nums and manipulate it directly.
	    // You should only use the Iterator interface methods.
	}

    // Returns the next element in the iteration without advancing the iterator.
	int peek() {
        if (flag) return value;

        value = Iterator::next();
        flag = true;

        return value;
	}

	// hasNext() and next() should behave the same as in the Iterator interface.
	// Override them if needed.
	int next() {
	    if (flag) {
            flag = false;
            return value;
        }
        return Iterator::next();
	}

	bool hasNext() const {
	    return flag || Iterator::hasNext();
	}
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for Peeking Iterator.
//Memory Usage: 10.1 MB, less than 29.73% of C++ online submissions for Peeking Iterator.
```


# solution (copy object tricky)

因为Iterator迭代器构造支持

```
Iterator(const Iterator& iter);
```

所以在执行**next()**时，copy出一个当前对象即可.

```
// Below is the interface for Iterator, which is already defined for you.
// **DO NOT** modify the interface for Iterator.
class Iterator {
    struct Data;
	Data* data;
public:
	Iterator(const vector<int>& nums);
	Iterator(const Iterator& iter);
	virtual ~Iterator();
	// Returns the next element in the iteration.
	int next();
	// Returns true if the iteration has more elements.
	bool hasNext() const;
};


class PeekingIterator : public Iterator {
public:
	PeekingIterator(const vector<int>& nums) : Iterator(nums) {
	    // Initialize any member here.
	    // **DO NOT** save a copy of nums and manipulate it directly.
	    // You should only use the Iterator interface methods.
	}

    // Returns the next element in the iteration without advancing the iterator.
	int peek() {
        // because the parent class construct support : Iterator(const Iterator& iter);
        return Iterator(*this).next();
	}

	// hasNext() and next() should behave the same as in the Iterator interface.
	// Override them if needed.
	int next() {
        return Iterator::next();
	}

	bool hasNext() const {
	    return Iterator::hasNext();
	}
};
```
