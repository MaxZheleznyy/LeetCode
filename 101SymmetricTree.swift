/*
Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).

Exmaple 1:
Input: root = [1,2,2,3,4,4,3]
Output: true
Visualized - https://assets.leetcode.com/uploads/2021/02/19/symtree1.jpg

Example 2:
Input: root = [1,2,2,null,3,null,3]
Output: false
Visualized - https://assets.leetcode.com/uploads/2021/02/19/symtree2.jpg
*/

struct Solution {
    static func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        let leftValuesArray = treeNodeValuesArray(node: root.left, mirrored: false)
        let rightValuesArray = treeNodeValuesArray(node: root.right, mirrored: true)
        return leftValuesArray == rightValuesArray
    }

    static func treeNodeValuesArray(node: TreeNode?, mirrored: Bool) -> [Int?] {
        guard let node = node else { return [] }
        guard node.left != nil || node.right != nil else { return [node.val] }
        var mappedArray: [Int?] = [node.val]
        let left = node.left == nil ? [nil] : treeNodeValuesArray(node: node.left, mirrored: mirrored)
        let right = node.right == nil ? [nil] : treeNodeValuesArray(node: node.right, mirrored: mirrored)
        if mirrored {
            mappedArray.append(contentsOf: right)
            mappedArray.append(contentsOf: left)
        } else {
            mappedArray.append(contentsOf: left)
            mappedArray.append(contentsOf: right)
        }
        return mappedArray
    }
}
