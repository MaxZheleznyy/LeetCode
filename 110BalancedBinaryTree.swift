/*
Given a binary tree, determine if it is height-balanced.
For this problem, a height-balanced binary tree is defined as: a binary tree in which the left and right subtrees of every node differ in height by no more than 1.

Example 1:
Input: root = [3,9,20,null,null,15,7]
Output: true
Visualization - https://assets.leetcode.com/uploads/2020/10/06/balance_1.jpg

Example 2:
Input: root = [1,2,2,3,3,null,null,4,4]
Output: false
Visualization - https://assets.leetcode.com/uploads/2020/10/06/balance_2.jpg
*/

struct Solution {
    static func isBalanced(_ root: TreeNode?) -> Bool {
        return height(for: root) != nil
    }

    static func height(for node: TreeNode?) -> Int? {
        guard let nonEmptyNode = node else { return 0 }
        guard
            let leftNodeValue = height(for: nonEmptyNode.left),
            let rightNodeValue = height(for: nonEmptyNode.right),
            abs(leftNodeValue - rightNodeValue) < 2
        else {
            return nil
        }

        return max(leftNodeValue, rightNodeValue) + 1
    }
}
