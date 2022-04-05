// https://programmers.co.kr/learn/courses/30/lessons/77884

/**
 -
 */

import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
  (left...right).reduce(0) {
    $0 + (getAliquotCount(of: $1) % 2 == 0 ? $1 : -$1)
  }
}

func getAliquotCount(of number: Int) -> Int {
  let sqrtNum = Int(sqrt(Double(number)))
  
  var count = (1...sqrtNum).reduce(0) {
    number % $1 == 0 ? ($0 + 1) : $0
  }
  
  count *= 2
  
  if sqrtNum * sqrtNum == number {
    count -= 1
  }
  
  return count
}

print(solution(13, 17)) // 43
print(solution(24, 27)) // 52

