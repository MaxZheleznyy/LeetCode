/*
Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.

Example 1:
Input: s = "()[]{}"
Output: true

Example 2:
Input: s = "([)]"
Output: false
*/


struct Solution {
    static func isValid(_ s: String) -> Bool {
        guard !s.isEmpty else { return true }
        let braceMappingDictionary: [Character: Character] = [")": "(", "}": "{", "]": "["]
        var bracesStorage = [Character]()

        for braceChar in s {
            if let openingBrace = braceMappingDictionary[braceChar] {
                let lastBrace = bracesStorage.isEmpty ? Character("x") : bracesStorage.removeLast()
                guard openingBrace == lastBrace else { return false }
            } else {
                bracesStorage.append(braceChar)
            }
        }
        return bracesStorage.isEmpty
    }
}
