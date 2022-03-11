// https://programmers.co.kr/learn/courses/30/lessons/12931

/**
 */

import Foundation

func solution(_ n:Int) -> Int {
  var number = n
  var result = 0
  
  while number / 10 != 0 {
    result += (number % 10)
    number = number / 10
  }
  
  return result + number
}

print(solution(123)) // 6
print(solution(987)) // 24

