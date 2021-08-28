/*
Given an integer n, return the number of trailing zeroes in factorial of n

Examples:
Input: n = 3
Output: 0
Explanation: 3! = 6, no trailing zero.

Input: n = 5
Output: 1
Explanation: 5! = 120, one trailing zero.

Input: n = 0
Output: 0
*/


class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        var zeroCount = 0
        var multiplicator = 5
        while n / multiplicator >= 1 {
            zeroCount += n / multiplicator
            multiplicator *= 5
        }
        return zeroCount
    }
}
