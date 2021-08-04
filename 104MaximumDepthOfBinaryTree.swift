/*
Given the root of a binary tree, return its maximum depth.
A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

Example 1:
Input: root = [3,9,20,null,null,15,7]
Output: 3
Visualization - https://assets.leetcode.com/uploads/2020/11/26/tmp-tree.jpg

Example 2:
Input: root = [1,null,2]
Output: 2
*/

struct Solution {
    static func maxDepth(_ root: TreeNode?) -> Int {
        guard let node = root else { return 0 }
        let leftDepth = maxDepth(node.left)
        let rightDepth = maxDepth(node.right)
        let maxDepth = max(leftDepth, rightDepth)
        return maxDepth + 1
    }
}
