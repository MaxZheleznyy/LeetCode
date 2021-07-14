/*
Given an integer x, return true if x is palindrome integer.

An integer is a palindrome when it reads the same backward as forward. For example, 121 is palindrome while 123 is not

Example 1:
Input: x = 121
Output: true

Example 2:
Input: x = -121
Output: false
Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
*/

struct Solution {
     static func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        let stringedInt = String(abs(x))
        var reversedNumString = ""
        stringedInt.forEach {
            reversedNumString.insert($0, at: reversedNumString.startIndex)
        }
        guard let finalNum = Int(reversedNumString) else { return false }
        return finalNum == x
     }
 }
