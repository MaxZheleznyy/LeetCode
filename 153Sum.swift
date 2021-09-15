/*
Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
Notice that the solution set must not contain duplicate triplets.

Examples:
Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]

Input: nums = []
Output: []

Input: nums = [0]
Output: []

Input: nums = [1, 2]
Output: []

Input: nums = [1, 2, 3]
Output: [[1, 2, 3]]
*/

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        let sortedNums = nums.sorted()
        let sortedCount = sortedNums.count
        var finalResult: [[Int]] = []
        for (index, num) in sortedNums.enumerated() {
            guard index + 2 < sortedCount else { continue }
            if index > 0 {
                guard sortedNums[index-1] != num else { continue }
            }
            var leftIndex = index + 1
            var rightIndex = sortedCount - 1
            twoSumLoop: while leftIndex < rightIndex {
                let leftValue = sortedNums[leftIndex]
                let rightValue = sortedNums[rightIndex]
                let sum = leftValue + rightValue + num
                if sum == 0 {
                    finalResult.append([num, leftValue, rightValue])
                    repeat {
                        leftIndex += 1
                    } while leftIndex < rightIndex && sortedNums[leftIndex-1] == sortedNums[leftIndex]
                    repeat {
                        rightIndex -= 1
                    } while leftIndex < rightIndex && sortedNums[rightIndex+1] == sortedNums[rightIndex]
                } else if sum > 0 {
                    rightIndex -= 1
                } else if sum < 0 {
                    leftIndex += 1
                } else {
                    break twoSumLoop
                }
            }
        }
        
        return finalResult
    }
}
