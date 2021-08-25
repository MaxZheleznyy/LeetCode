/*
Given an integer columnNumber, return its corresponding column title as it appears in an Excel sheet.

Example 1:
Input: columnNumber = 28
Output: "AB"

Example 2:
Input: columnNumber = 701
Output: "ZY"

Example 3:
Input: columnNumber = 2147483647
Output: "FXSHRXW"
*/

class Solution {
    func convertToTitle(_ columnNumber: Int) -> String {
        guard columnNumber > 0 else { return "" }
        var output = ""
        var numberCopy = columnNumber
        while numberCopy > 0 {
            let charCode = (numberCopy - 1) % 26
            let char = String(describing: UnicodeScalar(65 + charCode)!)
            output = char + output

            numberCopy = Int((numberCopy - 1) / 26)
        }

        return output
    }
}
