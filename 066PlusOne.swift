/*
Given a non-empty array of decimal digits representing a non-negative integer, increment one to the integer.
The digits are stored such that the most significant digit is at the head of the list, and each element in the array contains a single digit.
You may assume the integer does not contain any leading zero, except the number 0 itself.

Example 1:
Input: digits = [1,2,3]
Output: [1,2,4]
Explanation: The array represents the integer 123.

Example 2:
Input: digits = [0]
Output: [1]
*/

struct Solution {
    static func plusOne(_ digits: [Int]) -> [Int] {
        var finalArray = [Int]()
        var addPlusOne = false
        for digit in digits.reversed() {
            var nextDigit = digit
            if addPlusOne || finalArray.isEmpty {
                nextDigit += 1
                addPlusOne = false
            }

            if nextDigit > 9 {
                addPlusOne = true
                nextDigit = 0
            }

            finalArray.insert(nextDigit, at: 0)
        }

        if addPlusOne {
            finalArray.insert(1, at: 0)
        }

        return finalArray
    }
}
