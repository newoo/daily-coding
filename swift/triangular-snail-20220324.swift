// https://programmers.co.kr/learn/courses/30/lessons/68645

/**
 */

import Foundation

struct Block {
  let row: Int
  let col: Int
  let number: Int
}

func solution(_ n:Int) -> [Int] {
  var number = 1
  var blocks = [Block]()
  
  var position = (0, 1)
  var direction = 1
  
  (1...n).reversed().forEach { max in
    (1...max).forEach { _ in
      if direction % 3 == 1 {
        position.0 += 1
      }
      
      if direction % 3 == 2 {
        position.1 += 1
      }
      
      if direction % 3 == 0 {
        position.0 -= 1
        position.1 -= 1
      }
      
      blocks.append(.init(row: position.0, col: position.1, number: number))
      number += 1
    }
    
    direction += 1
  }

  return blocks.sorted(by: { $0.col < $1.col })
    .sorted(by: {$0.row < $1.row })
    .map(\.number)
}

print(solution(4)) // [1,2,9,3,10,8,4,5,6,7]
print(solution(5)) // [1,2,12,3,13,11,4,14,15,10,5,6,7,8,9]
print(solution(6)) // [1,2,15,3,16,14,4,17,21,13,5,18,19,20,12,6,7,8,9,10,11]

