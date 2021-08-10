/*
Given an integer numRows, return the first numRows of Pascal's triangle.
In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:
Visualization - https://upload.wikimedia.org/wikipedia/commons/0/0d/PascalTriangleAnimated2.gif

Example 1:
Input: numRows = 5
Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]

Example 2:
Input: numRows = 1
Output: [[1]]
*/

struct Solution {
    static func generate(_ numRows: Int) -> [[Int]] {
        var numsTriangle: [[Int]] = []
        var previousRow: [Int] = []
        for _ in 0...numRows {
            let newRow = rowGenerator(previousRow: previousRow)
            previousRow = newRow
            numsTriangle.append(newRow)
        }
        return numsTriangle
    }

    static func rowGenerator(previousRow: [Int]) -> [Int] {
        guard !previousRow.isEmpty else { return [1] }
        guard previousRow.count != 1 else { return [1, 1] }
        let newRowNumsCount = previousRow.count + 1
        var numsArray: [Int] = []
        for num in 1...newRowNumsCount {
            let index = num - 1
            if index == 0 || index == newRowNumsCount - 1 {
                numsArray.append(1)
            } else {
                let rightPreviousRowValue = previousRow[index - 1]
                let leftPreviousRowValue = previousRow[index]
                let newValue = rightPreviousRowValue + leftPreviousRowValue
                numsArray.append(newValue)
            }
        }
        return numsArray
    }
}
