/*
Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.

Example 1:
Input: head = [1,1,2]
Output: [1,2]

Example 2:
Input: head = [1,1,2,3,3]
Output: [1,2,3]
*/

struct Solution {
    static func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return head }
        if head.val == head.next?.val {
            head.next = head.next?.next
            deleteDuplicates(head)
        } else if head.next?.next != nil {
            deleteDuplicates(head.next)
        }

        return head
    }
}
