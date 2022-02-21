// https://programmers.co.kr/learn/courses/30/lessons/68644

/**
 */

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
  var results  = Set<Int>()
  
  numbers.enumerated().forEach { number in
    numbers.enumerated().forEach {
      if $0.offset == number.offset {
        return
      }
      
      results.insert(number.element + $0.element)
    }
  }
  
  return results.sorted()
}

print(solution([2,1,3,4,1])) // [2,3,4,5,6,7]
print(solution([5,0,2,7])) // [2,5,7,9,12]

