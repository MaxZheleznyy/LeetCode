/*
Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000

For example, 2 is written as II in Roman numeral, just two one's added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.
Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

I can be placed before V (5) and X (10) to make 4 and 9. 
X can be placed before L (50) and C (100) to make 40 and 90. 
C can be placed before D (500) and M (1000) to make 400 and 900.

Given an integer, convert it to a roman numeral.

Examples:
Input: num = 3
Output: "III"

Input: num = 58
Output: "LVIII"
Explanation: L = 50, V = 5, III = 3.

Input: num = 1994
Output: "MCMXCIV"
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.

Constraints:
1 <= num <= 3999
*/

class Solution {

    // 0, 1000, 2000, 3000
    private let thousands: [String] = ["", "M", "MM", "MMM"]
    // 0, 100, 200, 300, 400, 500, 600, 700, 800, 900
    private let hundreds: [String] = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
    // 0, 10, 20, 30, 40, 50, 60, 70, 80, 90,
    private let tens: [String] = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
    // 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    private let ones: [String] = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]

    func intToRoman(_ num: Int) -> String {
        let m = thousands[num / 1000]
        let c = hundreds[(num % 1000) / 100]
        let x = tens[(num % 100) / 10]
        let i = ones[num % 10]
        return m + c + x + i
    }
}
