/*
Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:
0 <= a, b, c, d < n
a, b, c, and d are distinct.
nums[a] + nums[b] + nums[c] + nums[d] == target

You may return the answer in any order.

Examples:
Input: nums = [1,0,-1,0,-2,2], target = 0
Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]

Input: nums = [2,2,2,2,2], target = 8
Output: [[2,2,2,2]]

Constraints:
1 <= nums.length <= 200
-109 <= nums[i] <= 109
-109 <= target <= 109
*/

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else { return [] }
        
        let sortedNums = nums.sorted()
        let sortedNumsCount = sortedNums.count
        var result: [[Int]] = []
        firstLoop: for i in 0...(sortedNumsCount - 4) {
            if i > 0 && sortedNums[i] == sortedNums[i - 1] {
                continue firstLoop
            }
            
            let minSum = sortedNums[i] + sortedNums[i + 1] + sortedNums[i + 2] + sortedNums[i + 3]
            if minSum > target {
                break firstLoop
            } else if minSum == target {
                result.append([sortedNums[i], sortedNums[i + 1], sortedNums[i + 2], sortedNums[i + 3]])
                break firstLoop
            }
            
            let maxSum = sortedNums[i] + sortedNums[sortedNumsCount - 1] + sortedNums[sortedNumsCount - 2] + sortedNums[sortedNumsCount - 3]
            if maxSum < target {
                continue firstLoop
            } else if maxSum == target {
                result.append([sortedNums[i], sortedNums[sortedNumsCount - 1], sortedNums[sortedNumsCount - 2], sortedNums[sortedNumsCount - 3]])
                continue firstLoop
            }
            
            secondLoop: for j in i + 1...(sortedNumsCount - 3) {
                if j > i + 1 && sortedNums[j] == sortedNums[j - 1] {
                    continue secondLoop
                }
                
                let semiTarget = target - sortedNums[i] - sortedNums[j]
                let minSum = sortedNums[j + 1] + sortedNums[j + 2]
                if minSum > semiTarget {
                    break secondLoop
                } else if minSum == semiTarget {
                    result.append([sortedNums[i], sortedNums[j], sortedNums[j + 1], sortedNums[j + 2]])
                    break secondLoop
                }
                
                let maxSum = sortedNums[sortedNumsCount - 1] + sortedNums[sortedNumsCount - 2]
                if maxSum < semiTarget {
                    continue secondLoop
                } else if maxSum == semiTarget {
                    result.append([sortedNums[i], sortedNums[j], sortedNums[sortedNumsCount - 1], sortedNums[sortedNumsCount - 2]])
                    continue secondLoop
                }
                
                var left = j + 1
                var right = sortedNumsCount - 1
                while left < right {
                    let sum = sortedNums[left] + sortedNums[right]
                    if sum == semiTarget {
                        result.append([sortedNums[i], sortedNums[j], sortedNums[left], sortedNums[right]])
                    }
                    
                    if sum < semiTarget {
                        repeat {
                            left += 1
                        } while (left < right && sortedNums[left] == sortedNums[left - 1])
                    } else {
                        repeat {
                            right -= 1
                        } while (left < right && sortedNums[right] == sortedNums[right + 1])
                    }
                }
            }
        }
        
        return result
    }
}
