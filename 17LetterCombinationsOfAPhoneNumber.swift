/*
Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.
A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
Visualization - https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Telephone-keypad2.svg/200px-Telephone-keypad2.svg.png

Examples:
Input: digits = "23"
Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]

Input: digits = ""
Output: []

Input: digits = "2"
Output: ["a","b","c"]

Constraints:
0 <= digits.length <= 4
digits[i] is a digit in the range ['2', '9']
*/

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        var result: [String] = []
        for char in digits {
            let digitLetters = String(char).lettersArray
            guard result.count > 0 else {
                result = digitLetters
                continue
            }
            var newResult: [String] = []
            for digitLetter in digitLetters {
                for resultLetter in result {
                    newResult.append("\(resultLetter)\(digitLetter)")
                }
            }
            result = newResult
        }
        return result
    }
}

private extension String {
    var lettersArray: [String] {
        switch self {
        case "2":
            return ["a", "b", "c"]
        case "3":
            return ["d", "e", "f"]
        case "4":
            return ["g", "h", "i"]
        case "5":
            return ["j", "k", "l"]
        case "6":
            return ["m", "n", "o"]
        case "7":
            return ["p", "q", "r", "s"]
        case "8":
            return ["t", "u", "v"]
        case "9":
            return ["w", "x", "y", "z"]
        default:
            return []
        }
    }
}
