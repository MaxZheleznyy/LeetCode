/*
Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of the line i is at (i, ai) and (i, 0). Find two lines, which, together with the x-axis forms a container, such that the container contains the most water.
Notice that you may not slant the container.

Example 1:
Input: height = [1,8,6,2,5,4,8,3,7]
Output: 49
Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
Visualization - https://s3-lc-upload.s3.amazonaws.com/uploads/2018/07/17/question_11.jpg

Example 2:
Input: height = [4,3,2,1,4]
Output: 16

Example 3:
Input: height = [1,2,1]
Output: 2

Example 4:
Input: height = [1,1]
Output: 1
*/

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var startIndex = 0
        var endIndex = height.count - 1
        var result = 0

        while startIndex < endIndex {
            let startLevel = height[startIndex]
            let endLevel = height[endIndex]
            let waterArea = min(startLevel, endLevel) * (endIndex - startIndex)
            if waterArea > result {
                result = waterArea
            }
            if startLevel < endLevel {
                startIndex += 1
            } else {
                endIndex -= 1
            }
        }

        return result
    }
}
