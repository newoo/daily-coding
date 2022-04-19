// https://programmers.co.kr/learn/courses/30/lessons/12980

/**
 */

import Foundation

func solution(_ n:Int) -> Int {
  var n = n
  var jumpCount = 1
  
  while n > 1 {
    if n % 2 == 0 {
      n /= 2
    } else {
      n -= 1
      jumpCount += 1
    }
  }
  
  return jumpCount
}

print(solution(5)) // 2
print(solution(6)) // 2
print(solution(5000)) // 5

