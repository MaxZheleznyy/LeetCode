/*
Given a string s, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

Example 1:
Input: s = "A man, a plan, a canal: Panama"
Output: true
Explanation: "amanaplanacanalpanama" is a palindrome.

Example 2:
Input: s = "race a car"
Output: false
Explanation: "raceacar" is not a palindrome.
*/

import Foundation

struct Solution {
    static func isPalindrome(_ s: String) -> Bool {
        let filteredS = s.components(
            separatedBy: CharacterSet.punctuationCharacters
        ).joined(separator: "").components(
            separatedBy: CharacterSet.whitespacesAndNewlines
        ).joined(separator: "").components(
            separatedBy: CharacterSet.symbols
        ).joined(separator: "")
        .lowercased()
        let reversedS = String(filteredS.reversed())
        return filteredS == reversedS
    }
}
