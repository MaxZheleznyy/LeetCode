/*
Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
Example 1:
Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
Output: 6
Explanation: [4,-1,2,1] has the largest sum = 6.
Example 2:
Input: nums = [5,4,-1,7,8]
Output: 23
*/

struct Solution {
    static func maxSubArray(_ nums: [Int]) -> Int {
        guard var maxSum = nums.first else { return 0 }
        var numsCopy = nums
        for index in 1..<numsCopy.count {
            if numsCopy[index - 1] > 0 {
                numsCopy[index] = max(numsCopy[index], numsCopy[index] + numsCopy[index - 1])
            }

            maxSum = max(maxSum, numsCopy[index])
        }

        return maxSum
    }
}
