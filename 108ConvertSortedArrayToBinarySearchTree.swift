/*
Given an integer array nums where the elements are sorted in ascending order, convert it to a height-balanced binary search tree.
A height-balanced binary tree is a binary tree in which the depth of the two subtrees of every node never differs by more than one.

Example 1:
Input: nums = [-10,-3,0,5,9]
Output: [0,-3,9,-10,null,5]
Visualization - https://assets.leetcode.com/uploads/2021/02/18/btree1.jpg
Explanation: [0,-10,5,null,-3,null,9] is also accepted:
Visualization - https://assets.leetcode.com/uploads/2021/02/18/btree2.jpg

Example 2:
Input: nums = [1,3]
Output: [3,1]
Explanation: [1,3] and [3,1] are both a height-balanced BSTs.
*/

struct Solution {
    static func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard nums.count > 0 else { return nil }
        return balancedTreeNode(0, nums.count - 1, nums)
    }

    static func balancedTreeNode(_ leftPosition: Int, _ rightPosition: Int, _ nums: [Int]) -> TreeNode? {
        guard leftPosition <= rightPosition else { return nil }
        let middlePosition = (leftPosition + rightPosition) / 2
        let root = TreeNode(nums[middlePosition])
        root.left = balancedTreeNode(leftPosition, middlePosition - 1, nums)
        root.right = balancedTreeNode(middlePosition + 1, rightPosition, nums)

        return root
    }
}
