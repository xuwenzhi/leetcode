# delete-node-in-a-linked-list

[https://leetcode.com/problems/delete-node-in-a-linked-list/](https://leetcode.com/problems/delete-node-in-a-linked-list/)

# thinking

最开始有点摸不清头脑，这个入参只给了个节点，而没有给头结点，所以有点懵逼，后来才知道，这个问题很正常!

# solution

```golang
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func deleteNode(node *ListNode) {
    var p *ListNode = node
    for p.Next != nil {
        p.Val = p.Next.Val
        if p.Next.Next == nil {
            p.Next = nil
            break
        }
        p = p.Next
    }
}
```
