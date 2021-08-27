/*
Given a string columnTitle that represents the column title as appear in an Excel sheet, return its corresponding column number.

Examples:
Input: columnTitle = "A"
Output: 1

Input: columnTitle = "AB"
Output: 28

Input: columnTitle = "ZY"
Output: 701

Input: columnTitle = "FXSHRXW"
Output: 2147483647
*/

class Solution {
    func titleToNumber(_ columnTitle: String) -> Int {
        guard let scalarOfA = "A".unicodeScalars.first else { return 0 }
        var columnNumber = 0
        for char in columnTitle {
            guard let scalarOfChar = String(char).unicodeScalars.first else { return 0 }
            let value = Int(scalarOfChar.value - scalarOfA.value + 1)
            columnNumber = columnNumber * 26 + value
        }
        return columnNumber
    }
}
