// https://programmers.co.kr/learn/courses/30/lessons/12910

/**
 */

import Foundation

func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
  let arr = arr.filter { $0 % divisor == 0 }.sorted()
  return arr.isEmpty ? [-1] : arr
}

print(solution([5, 9, 7, 10], 5)) // [5, 10]
print(solution([2, 36, 1, 3], 1)) // [1, 2, 3, 36]
print(solution([3,2,6], 10)) // [-1]

