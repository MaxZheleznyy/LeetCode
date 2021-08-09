/*
Given the root of a binary tree and an integer targetSum, return true if the tree has a root-to-leaf path such that adding up all the values along the path equals targetSum.
A leaf is a node with no children.

Example 1:
Input: root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
Output: true
Visualization - https://assets.leetcode.com/uploads/2021/01/18/pathsum1.jpg

Example 2:
Input: root = [1,2,3], targetSum = 5
Output: false
Visualization - https://assets.leetcode.com/uploads/2021/01/18/pathsum2.jpg
*/

struct Solution {
    static func hasPathSum(_ root: TreeNode?, _ targetSum: Int, currentSum: Int = 0) -> Bool {
        guard let root = root else { return false }
        let newCurrentSum = currentSum + root.val
        if root.left != nil || root.right != nil {
            let leftHasPath = hasPathSum(root.left, targetSum, currentSum: newCurrentSum)
            let rightHasPath = hasPathSum(root.right, targetSum, currentSum: newCurrentSum)
            return leftHasPath || rightHasPath
        } else {
            return newCurrentSum == targetSum
        }
    }
}
