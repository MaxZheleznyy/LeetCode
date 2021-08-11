/*
Given an integer rowIndex, return the rowIndexth (0-indexed) row of the Pascal's triangle.
In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:
Visualization - https://upload.wikimedia.org/wikipedia/commons/0/0d/PascalTriangleAnimated2.gif

Example 1:
Input: rowIndex = 3
Output: [1,3,3,1]

Example 2:
Input: rowIndex = 0
Output: [1]
*/

struct Solution {
    static func getRow(_ rowIndex: Int) -> [Int] {
        guard rowIndex > 0 else { return [1] }
        guard rowIndex != 1 else { return [1, 1] }
        var previousRow: [Int] = [1,1]
        for index in 2...rowIndex {
            let newRow = rowGenerator(previousRow: previousRow)
            if index != rowIndex {
                previousRow = newRow
            } else {
                return newRow
            }
        }
        return [1]
    }

    static func rowGenerator(previousRow: [Int]) -> [Int] {
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
