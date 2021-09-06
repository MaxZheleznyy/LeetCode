/*
Given a string s, return the longest palindromic substring in s.

Examples:
Input: s = "babad"
Output: "bab"
Note: "aba" is also a valid answer.

Input: s = "cbbd"
Output: "bb"

Input: s = "a"
Output: "a"
*/

class Solution {

    func longestPalindrome(_ s: String) -> String {
        var result = ""
        var palindrome = ""
        let charArray: Array<Character> = Array(s)
        var index = 0

        while index < charArray.count {
            guard result.count < (charArray.count - index) * 2 else { break }
            palindrome = findPalindrome(within: charArray, start: index, end: index)
            if palindrome.count > result.count {
                result = palindrome
            }

            palindrome = findPalindrome(within: charArray, start: index, end: index + 1)
            if palindrome.count > result.count {
                result = palindrome
            }
            index += 1
        }
        return result
    }

    private func findPalindrome(within charArray: Array<Character>, start: Int, end: Int) -> String {
        var leftIndex = start
        var rightIndex = end
        while leftIndex >= 0 && rightIndex < charArray.count {
            guard charArray[leftIndex] == charArray[rightIndex] else { break }
            leftIndex -= 1
            rightIndex += 1
        }
        return String(charArray[leftIndex + 1..<rightIndex])
    }
}
