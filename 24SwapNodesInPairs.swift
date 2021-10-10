/*
Given a linked list, swap every two adjacent nodes and return its head. You must solve the problem without modifying the values in the list's nodes (i.e., only nodes themselves may be changed.)

Example 1:
Input: head = [1,2,3,4]
Output: [2,1,4,3]
Visualization - https://assets.leetcode.com/uploads/2020/10/03/swap_ex1.jpg

Example 2:
Input: head = []
Output: []

Constraints:
The number of nodes in the list is in the range [0, 100].
0 <= Node.val <= 100
*/

class Solution {
    
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var current: ListNode? = dummy
        
        while current?.next != nil && current?.next?.next != nil {
            let first = current?.next
            let second = current?.next?.next
            
            first?.next = second?.next
            current?.next = second
            current?.next?.next = first
            current = current?.next?.next
        }
        return dummy.next
    }
}
