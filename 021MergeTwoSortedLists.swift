/*
Merge two sorted linked lists and return it as a sorted list. The list should be made by splicing together the nodes of the first two lists.

Example:
Input: l1 = [1,2,4], l2 = [1,3,4]
Output: [1,1,2,3,4,4]
Visit https://assets.leetcode.com/uploads/2020/10/03/merge_ex1.jpg for visuals
*/

struct Solution {
    static func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let passedL1 = l1 else { return l2 }
        guard let passedL2 = l2 else { return passedL1 }

        if passedL1.val <= passedL2.val {
            passedL1.next = mergeTwoLists(passedL1.next, passedL2)
            return passedL1
        } else {
            passedL2.next = mergeTwoLists(passedL1, passedL2.next)
            return passedL2
        }
    }
}
