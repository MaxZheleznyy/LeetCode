/*
Given the roots of two binary trees p and q, write a function to check if they are the same or not.
Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.

Example 1:
Input: p = [1,2,3], q = [1,2,3]
Output: true

Example 2:
Input: p = [1,2], q = [1,null,2]
Output: false
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
    static func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        let mappedP = treeNodeValuesArray(node: p)
        let mappedQ = treeNodeValuesArray(node: q)
        return mappedP == mappedQ
    }

    static func treeNodeValuesArray(node: TreeNode?) -> [Int?] {
        guard let node = node else { return [] }
        guard node.left != nil || node.right != nil else { return [node.val] }
        var mappedArray: [Int?] = [node.val]
        let left = node.left == nil ? [nil] : treeNodeValuesArray(node: node.left)
        let right = node.right == nil ? [nil] : treeNodeValuesArray(node: node.right)
        mappedArray.append(contentsOf: left)
        mappedArray.append(contentsOf: right)
        return mappedArray
    }
}
