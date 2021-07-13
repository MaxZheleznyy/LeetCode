/*
Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

Example:
Input: x = 123
Output: 321

Input: x = -123
Output: -321

Input: x = 120
Output: 21
*/

struct Solution {
    static func reverse(_ x: Int) -> Int {
        let isNegative = x < 0
        let stringedInt = String(abs(x))
        var reversedNumString = ""
        stringedInt.forEach {
            reversedNumString.insert($0, at: reversedNumString.startIndex)
        }

        let intMax = (2 << 30) - 1
        let intMin = (-intMax + 1)
        let finalNum = (Int(reversedNumString) ?? 0) * (isNegative ? -1 : 1)
        guard finalNum >= intMin && finalNum <= intMax else { return 0 }
        return finalNum
    }
}
