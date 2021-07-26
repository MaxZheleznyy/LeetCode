/*
Given two binary strings a and b, return their sum as a binary string.

Example 1:
Input: a = "11", b = "1"
Output: "100"

Example 2:
Input: a = "1010", b = "1011"
Output: "10101"
*/

struct Solution {
    static func addBinary(_ a: String, _ b: String) -> String {
        var aCopy = a
        var bCopy = b
        var carry = 0
        var resultValue = ""

        while aCopy.isEmpty == false || bCopy.isEmpty == false || carry > 0 {
            guard let x = Int(aCopy.isEmpty ? "0" : String(aCopy.removeLast())) else { continue }
            guard let y = Int(bCopy.isEmpty ? "0" : String(bCopy.removeLast())) else { continue }
            let sum = x + y + carry
            carry = sum / 2
            resultValue = String(sum % 2) + resultValue
        }

        return resultValue
    }
}
