// https://programmers.co.kr/learn/courses/30/lessons/87389

/**
 */

import Foundation

func solution(_ n:Int) -> Int {
  var divider = 2
  
  while n % divider != 1 {
    divider += 1
  }
  
  return divider
}

print(solution(10)) // 3
print(solution(12)) // 11

