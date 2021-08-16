/*
Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
You must implement a solution with a linear runtime complexity and use only constant extra space.

Example 1:
Input: nums = [2,2,1]
Output: 1

Example 2:
Input: nums = [4,1,2,1,2]
Output: 4

Example 3:
Input: nums = [1]
Output: 1
*/

struct Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.first ?? 0 }
        let mappedNums = Dictionary(grouping: nums, by: { $0 })
        let finalNum = mappedNums.first { $0.value.count == 1 }
        return finalNum?.key ?? 0
    }
}
