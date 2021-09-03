/*
Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
The overall run time complexity should be O(log (m+n)).

Examples:
Input: nums1 = [1,3], nums2 = [2]
Output: 2.00000
Explanation: merged array = [1,2,3] and median is 2.

Input: nums1 = [1,2], nums2 = [3,4]
Output: 2.50000
Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.

Input: nums1 = [0,0], nums2 = [0,0]
Output: 0.00000

Input: nums1 = [], nums2 = [1]
Output: 1.00000
*/

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var combinedArray: [Int] = nums1 + nums2
        combinedArray.sort()
        let middleIndex = combinedArray.index(combinedArray.startIndex, offsetBy: (combinedArray.count - 1) / 2)
        return combinedArray.count % 2 == 0
            ? Double(combinedArray[middleIndex] + combinedArray[combinedArray.index(middleIndex, offsetBy: 1)]) / 2
            : Double(combinedArray[middleIndex])
    }
}
