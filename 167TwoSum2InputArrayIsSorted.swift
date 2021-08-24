/*
Given an array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number.
Return the indices of the two numbers (1-indexed) as an integer array answer of size 2, where 1 <= answer[0] < answer[1] <= numbers.length.
The tests are generated such that there is exactly one solution. You may not use the same element twice.

Example 1:
Input: numbers = [2,7,11,15], target = 9
Output: [1,2]
Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.

Example 2:
Input: numbers = [2,3,4], target = 6
Output: [1,3]
*/

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var checkedNums = Set<Int>()
        for (index, num) in numbers.enumerated() {
            guard !checkedNums.contains(num) else { continue }
            checkedNums.insert(num)
            guard num <= target else { continue }
            let possibleSecondNum = target - num
            guard let secondNumIndex = numbers.lastIndex(of: possibleSecondNum) else { continue }
            return [index + 1, secondNumIndex + 1]
        }
        return []
    }
}
