/*
Given a string s consists of some words separated by spaces, return the length of the last word in the string. If the last word does not exist, return 0.
A word is a maximal substring consisting of non-space characters only.

Example 1:
Input: s = "Hello World"
Output: 5
Example 2:
Input: s = " "
Output: 0
*/

struct Solution {
    static func lengthOfLastWord(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        var charCounter = 0
        let reversedS = s.reversed()

        for char in reversedS {
            if char != " " {
                charCounter += 1
            } else if char == " " && charCounter == 0 {
                continue
            } else {
                return charCounter
            }
        }
        return charCounter
    }
}
