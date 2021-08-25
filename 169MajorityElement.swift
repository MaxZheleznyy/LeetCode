/*
Given an array nums of size n, return the majority element.
The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

Example 1:
Input: nums = [3,2,3]
Output: 3

Example 2:
Input: nums = [2,2,1,1,1,2,2]
Output: 2
*/

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var numsDic: [Int: Int] = [:]
        nums.forEach { numsDic[$0] = (numsDic[$0] ?? 0) + 1 }
        return (numsDic.max { $0.value < $1.value })?.key ?? 0
    }
}
