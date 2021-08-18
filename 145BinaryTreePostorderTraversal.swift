/*
Given the root of a binary tree, return the postorder traversal of its nodes' values

Example 1:
Input: root = [1,null,2,3]
Output: [3,2,1]
Visualization - https://assets.leetcode.com/uploads/2020/09/15/inorder_1.jpg

Example 2:
Input: root = [1,2]
Output: [2,1]
Visualization - https://assets.leetcode.com/uploads/2020/09/15/inorder_5.jpg

Example 3:
Input: root = [1,null,2]
Output: [2,1]
Visualization - https://assets.leetcode.com/uploads/2020/09/15/inorder_4.jpg
*/

public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }

struct Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        let leftArray = postorderTraversal(root.left)
        let rightArray = postorderTraversal(root.right)
        return leftArray + rightArray + [root.val]
    }
}
