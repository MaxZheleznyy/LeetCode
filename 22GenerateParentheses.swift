/*
Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

Exmaples:
Input: n = 3
Output: ["((()))","(()())","(())()","()(())","()()()"]

Input: n = 1
Output: ["()"]
*/

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var parenthesisArray: [String] = []
        backtrack(parenthesisArray: &parenthesisArray, currentString: "", openIndex: 0, closeIndex: 0, maxIndex: n)
        return parenthesisArray
    }
    
    private func backtrack(
        parenthesisArray: inout [String],
        currentString: String,
        openIndex: Int,
        closeIndex: Int,
        maxIndex: Int
    ) {
        guard currentString.count != maxIndex * 2 else {
            parenthesisArray.append(currentString)
            return
        }
        
        if openIndex < maxIndex {
            backtrack(
                parenthesisArray: &parenthesisArray,
                currentString: currentString + "(",
                openIndex: openIndex + 1,
                closeIndex: closeIndex,
                maxIndex: maxIndex
            )
        }
        if closeIndex < openIndex {
            backtrack(
                parenthesisArray: &parenthesisArray,
                currentString: currentString + ")",
                openIndex: openIndex,
                closeIndex: closeIndex + 1,
                maxIndex: maxIndex
            )
        }
    }
}
