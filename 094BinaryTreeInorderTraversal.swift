/*
Given the root of a binary tree, return the inorder traversal of its nodes' values.

Example 1:
Input: root = [1,null,2,3]
Output: [1,3,2]

Example 2:
Input: root = [1,2]
Output: [2,1]
*/

/// Definition for a binary tree node.
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
    static func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var nodeValues: [Int] = []
        traversalIterator(root: root, nodeValues: &nodeValues)
        return nodeValues
    }

    static func traversalIterator(root: TreeNode?, nodeValues: inout [Int]) {
        guard let root = root else { return }
        traversalIterator(root: root.left, nodeValues: &nodeValues)
        nodeValues.append(root.val)
        traversalIterator(root: root.right, nodeValues: &nodeValues)
    }
}
