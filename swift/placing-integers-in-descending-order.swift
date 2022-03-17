// https://programmers.co.kr/learn/courses/30/lessons/12933

/**
 */

import Foundation

func solution(_ n:Int64) -> Int64 {
  var number = n
  var numbers = [Int64]()
  
  while number / 10 > 0 {
    numbers.append(number % 10)
    number /= 10
  }
  
  numbers.append(number)
  numbers.sort(by: >)
  
  return numbers.reduce(0) { $0 * 10 + $1 }
}
print(solution(118372)) // 873211

