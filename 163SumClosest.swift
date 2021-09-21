/*
Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target.
Return the sum of the three integers.
You may assume that each input would have exactly one solution.

Examples:
Input: nums = [-1,2,1,-4], target = 1
Output: 2
Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).

Input: nums = [0,0,0], target = 1
Output: 0

Constraints:
3 <= nums.length <= 1000
-1000 <= nums[i] <= 1000
-104 <= target <= 104
*/

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let sortedNums = nums.sorted()
        var finalResult = nums[0] + nums[1] + nums[2]
        var targetDiff = abs(finalResult - target)

        for (index, num) in sortedNums.enumerated() {
            var leftIndex = index + 1
            var rightIndex = sortedNums.count - 1

            while leftIndex < rightIndex {
                let sum = num + sortedNums[leftIndex] + sortedNums[rightIndex]
                guard sum != target else {
                    return target
                }
                let newDiff = abs(sum - target)
                if newDiff < targetDiff {
                    targetDiff = newDiff
                    finalResult = sum
                }
                if sum > target {
                    rightIndex -= 1
                } else {
                    leftIndex += 1
                }
            }
        }

        return finalResult
    }
}
