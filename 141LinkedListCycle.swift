/*
Given head, the head of a linked list, determine if the linked list has a cycle in it.
There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.
Return true if there is a cycle in the linked list. Otherwise, return false.

Example 1:
Input: head = [3,2,0,-4], pos = 1
Output: true
Explanation: There is a cycle in the linked list, where the tail connects to the 1st node (0-indexed).
Visualization - https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist.png

Example 2:
Input: head = [1,2], pos = 0
Output: true
Explanation: There is a cycle in the linked list, where the tail connects to the 0th node.
Visualization - https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist_test2.png
*/

struct Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        guard
            head != nil,
            head?.next != nil,
            head?.next?.next != nil
        else {
            return false
        }
        var slowIterator = head
        var fastIterator = head

        while fastIterator?.next != nil && fastIterator?.next?.next != nil {
            slowIterator = slowIterator?.next
            fastIterator = fastIterator?.next?.next

            if slowIterator === fastIterator {
                return true
            }
        }

        return false
    }
}
