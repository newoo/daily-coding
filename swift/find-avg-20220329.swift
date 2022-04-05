// https://programmers.co.kr/learn/courses/30/lessons/12944

/**
 */

import Foundation

func solution(_ arr:[Int]) -> Double {
  Double(arr.reduce(0, +)) / Double(arr.count)
}

print(solution([1,2,3,4])) // 2.5
print(solution([5,5])) // 5

