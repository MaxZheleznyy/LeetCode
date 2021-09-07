/*
The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

P   A   H   N
A P L S I I G
Y   I   R

And then read line by line: "PAHNAPLSIIGYIR"
Write the code that will take a string and make this conversion given a number of rows:
string convert(string s, int numRows);

Examples:
Input: s = "PAYPALISHIRING", numRows = 3
Output: "PAHNAPLSIIGYIR"

Input: s = "PAYPALISHIRING", numRows = 4
Output: "PINALSIGYAHRPI"
Explanation:
P     I    N
A   L S  I G
Y A   H R
P     I

Input: s = "A", numRows = 1
Output: "A"
*/

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }
        var stringedNumRows = Array(repeating: "", count: numRows)
        var currentRow = 0
        var shouldIncrease = false
        for char in s {
            stringedNumRows[currentRow] += String(char)
            if currentRow == 0 || currentRow == numRows - 1 {
                shouldIncrease = !shouldIncrease
            }
            currentRow = shouldIncrease ? currentRow + 1 : currentRow - 1
        }

        return stringedNumRows.joined()
    }
}
