/*
Given a binary tree, find its minimum depth.
The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
Note: A leaf is a node with no children.

Example 1:
Input: root = [3,9,20,null,null,15,7]
Output: 2
Visualization - https://assets.leetcode.com/uploads/2020/10/12/ex_depth.jpg

Example 2:
Input: root = [2,null,3,null,4,null,5,null,6]
Output: 5
*/

struct Solution {
    static func minDepth(_ root: TreeNode?, currentCount: Int = 0) -> Int {
        guard let root = root else { return 0 }
        if root.left != nil || root.right != nil {
            let leftDepth = minDepth(
                root.left,
                currentCount: currentCount > 0 ? currentCount + 1 : 2
            )
            let rightDepth = minDepth(
                root.right,
                currentCount: currentCount > 0 ? currentCount + 1 : 2
            )

            //For runtime speedup only
            if leftDepth != 0 && rightDepth != 0 {
                return min(leftDepth, rightDepth)
            }

            let left = leftDepth == 0 ? Int.max : leftDepth
            let right = rightDepth == 0 ? Int.max : rightDepth
            return min(left, right)
        } else {
            return currentCount > 0 ? currentCount : 1
        }
    }
}
