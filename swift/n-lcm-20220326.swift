// https://programmers.co.kr/learn/courses/30/lessons/12953

/**
 */

import Foundation

func solution(_ arr:[Int]) -> Int {
  arr.reduce(1) { lcm(($0, $1)) }
}

func lcm(_ numbers: (Int, Int)) -> Int {
  let length = min(numbers.0, numbers.1)
  
  guard length > 1 else { return numbers.0 * numbers.1 }
  
  var arr = (2...length).map { $0 }
  var left = numbers
  var result = 1
  
  while !arr.isEmpty {
    let first = arr.first!
    
    guard left.0 % first == 0,
          left.1 % first == 0 else {
            arr.removeFirst()
            continue
          }
    
    result *= first
    left = (left.0 / first, left.1 / first)
  }
  
  return result * left.0 * left.1
}

print(solution([2,6,8,14])) // 168
print(solution([1,2,3])) // 6
print(solution([3,4,9,16])) // 144

