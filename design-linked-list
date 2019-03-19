# design-linked-list

[https://leetcode.com/problems/design-linked-list/](https://leetcode.com/problems/design-linked-list/)

# thinking

The goal is that implement LinkList contain some functions.

# solution

```
typedef struct MyListNode{
    int val;
    struct MyListNode* next;
} MyLinkedList;

/** Initialize your data structure here. */
MyLinkedList* myLinkedListCreate() {
    MyLinkedList* head = (MyLinkedList*)malloc(sizeof(MyLinkedList));
    head->val = -1;
    head->next = NULL;
    return head;
}

/** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
int myLinkedListGet(MyLinkedList* obj, int index) {
    if (index < 0 || !obj) {
        return -1;
    }
    int i = 0;
    MyLinkedList* p = obj->next;
    if (!p) return -1;
    while (i < index) {
        p = p->next;
        i++;
        if (!p) {
            return -1;
        }
    }
    
    return p->val;
}

/** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
void myLinkedListAddAtHead(MyLinkedList* obj, int val) {
    MyLinkedList* newnode = (MyLinkedList*)malloc(sizeof(MyLinkedList));
    newnode->val = val;
    newnode->next = obj->next;
    obj->next = newnode;
}

    }
    if (p && i == index) {
        MyLinkedList *newnode = (MyLinkedList *)malloc(sizeof(MyLinkedList));
        newnode->val = val;
        newnode->next = p->next;
        p->next = newnode;
    }
    printMyLink(obj);
}

/** Delete the index-th node in the linked list, if the index is valid. */
void myLinkedListDeleteAtIndex(MyLinkedList* obj, int index) {
    MyLinkedList* p = obj;
    int i = 0;
    while (p != NULL) {
        if (i == index) {
            break;
        }
        i++;
        p = p->next;
    }
    if (p && p->next && i == index) {
        p->next = p->next->next;
    }
}
void myLinkedListFree(MyLinkedList* obj) {
    if (obj) {
        struct MyLinkedList *p = obj;
        while (obj) {
            p = obj;
            obj = obj->next;
            free(p);
        }
    }
}

void printMyLink(MyLinkedList* obj) {
    if (!obj) {
        printf("obj is empty!!!!!!");
    }
    while (obj) {
        obj = obj->next;
    }
    printf("end\n");
}

/**
 * Your MyLinkedList struct will be instantiated and called as such:
 * struct MyLinkedList* obj = myLinkedListCreate();
 * int param_1 = myLinkedListGet(obj, index);
 * myLinkedListAddAtHead(obj, val);
 * myLinkedListAddAtTail(obj, val);
 * myLinkedListAddAtIndex(obj, index, val);
 * myLinkedListDeleteAtIndex(obj, index);
 * myLinkedListFree(obj);
 */
 ```



