/*
ou are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Examples:
Input: l1 = [2,4,3], l2 = [5,6,4]
Output: [7,0,8]
Explanation: 342 + 465 = 807.

Input: l1 = [0], l2 = [0]
Output: [0]

Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
Output: [8,9,9,9,0,0,0,1]
*/

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let zeroNode = ListNode(0)
        var rightNode = l1
        var leftNode = l2
        var currentNode = zeroNode
        var carryOver = 0

        while rightNode != nil || leftNode != nil {
            let rightValue = rightNode?.val ?? 0
            let leftValue = leftNode?.val ?? 0
            let sum = rightValue + leftValue + carryOver

            carryOver = sum / 10
            currentNode.next = ListNode(sum % 10)
            currentNode = currentNode.next!

            rightNode = rightNode?.next
            leftNode = leftNode?.next
        }

        if carryOver > 0 {
            currentNode.next = ListNode(carryOver)
        }

        return zeroNode.next
    }
}
