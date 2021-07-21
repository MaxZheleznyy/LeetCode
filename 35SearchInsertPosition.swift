/*
Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
You must write an algorithm with O(log n) runtime complexity.

Example 1:
Input: nums = [1,3,5,6], target = 5
Output: 2

Example 2:
Input: nums = [1,3,5,6], target = 2
Output: 1
*/

struct Solution {
    static func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if let foundIndex = nums.firstIndex(of: target) {
            return foundIndex
        }

        var finalPosition = 0
        for (index, num) in nums.enumerated() {
            if num < target {
                finalPosition = index + 1
            } else {
                return finalPosition
            }
        }

        return finalPosition
    }
}
