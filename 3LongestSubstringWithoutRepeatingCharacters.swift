/*
Given a string s, find the length of the longest substring without repeating characters.

Examples:
Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.

Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.

Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

Input: s = ""
Output: 0
*/

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var characterDict: [Character: Int] = [:]
        var maxLength = 0
        var duplicatePosition = -1
        var counter = 0

        for char in s {
            if let savedCharPosition = characterDict[char], savedCharPosition > duplicatePosition {
                duplicatePosition = savedCharPosition
            }

            maxLength = max(counter - duplicatePosition, maxLength)
            characterDict[char] = counter
            counter += 1
        }

        return maxLength
    }
}
