// https://programmers.co.kr/learn/courses/30/lessons/12911

/**
 */

import Foundation

func solution(_ n:Int) -> Int {
  var m = n + 1
  
  while n.nonzeroBitCount != m.nonzeroBitCount {
    m += 1
  }
  
  return m
}

print(solution(78)) // 83
print(solution(15)) // 23

