/*
Implement strStr().
Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
Clarification:
What should we return when needle is an empty string? This is a great question to ask during an interview.
For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().
Example :
Input: haystack = "hello", needle = "ll"
Output: 2
*/

struct Solution {
    static func strStr(_ haystack: String, _ needle: String) -> Int {
        guard haystack.count > needle.count else { return haystack == needle ? 0 : -1 }
        guard let index = haystack.range(of: needle) else { return needle.isEmpty ? 0 : -1 }
        return haystack.distance(from: haystack.startIndex, to: index.lowerBound)
    }
}
