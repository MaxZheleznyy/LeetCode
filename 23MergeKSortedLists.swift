/*
You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.
Merge all the linked-lists into one sorted linked-list and return it.

Example 1:
Input: lists = [[1,4,5],[1,3,4],[2,6]]
Output: [1,1,2,3,4,4,5,6]
Explanation: The linked-lists are:
[
  1->4->5,
  1->3->4,
  2->6
]
merging them into one sorted list:
1->1->2->3->4->4->5->6

Example 2:
Input: lists = []
Output: []

Example 3:
Input: lists = [[]]
Output: []
*/

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 0 else { return nil }
        var startIndex = 0
        var endIndex = lists.count - 1
        var lists = lists

        while endIndex > 0 {
            startIndex = 0
            while startIndex < endIndex {
                lists[startIndex] = mergeTwoLists(start: lists[startIndex], end: lists[endIndex])
                startIndex += 1
                endIndex -= 1
            }
        }
        return lists[0]
    }
    
    private func mergeTwoLists(start: ListNode?, end: ListNode?) -> ListNode? {
        var mutableStart = start
        var mutableEnd = end

        let head: ListNode = ListNode(0)
        var tmp = head
        while mutableStart != nil && mutableEnd != nil {
            let startValue = mutableStart!.val
            let endValue = mutableEnd!.val

            if startValue > endValue {
                tmp.next = mutableEnd!
                mutableEnd = mutableEnd?.next
            } else {
                tmp.next = mutableStart!
                mutableStart = mutableStart?.next
            }
            tmp = tmp.next!
        }
        tmp.next = mutableStart ?? mutableEnd
        return head.next
    }
}
