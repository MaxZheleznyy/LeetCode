/*
Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string "".

Example 1:
Input: strs = ["flower","flow","flight"]
Output: "fl"

Example 2:
Input: strs = ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.
*/

struct Solution {
    static func longestCommonPrefix(_ strs: [String]) -> String {
        var finalString = strs.first ?? ""
        for passedString in strs {
            guard finalString != passedString else { continue }
            let passedStringCharArray = Array(passedString)
            let finalStringCopy = finalString
            for (index, char) in finalStringCopy.enumerated() {
                guard (finalString.count - 1) >= index else { break }

                let stringIndex = finalStringCopy.index(
                    finalStringCopy.startIndex,
                    offsetBy: index
                )
                guard index < passedStringCharArray.count else {
                    finalString = String.init(finalString.prefix(upTo: stringIndex))
                    continue
                }
                if passedStringCharArray[index] != char {
                    finalString = String.init(finalString.prefix(upTo: stringIndex))
                }
            }
        }

        return finalString
    }
 }
