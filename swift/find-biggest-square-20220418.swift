// https://programmers.co.kr/learn/courses/30/lessons/12905

/**
 */

import Foundation

func solution(_ board:[[Int]]) -> Int {
  var answer: Int? = nil
  var position = (0, 0)
  
  let minCount = min(board.count, board.first!.count)
  
  if minCount < 2 {
    return board.contains(where: { $0.contains(1) }) ? 1 : 0
  }
  
  for length in (1...minCount).reversed() {
    for y in (0..<board.first!.count) {
      position.1 = y
      for x in (0..<board.count) {
        position.0 = x
        
        if canSqaure(board: board, position: position, length: length) {
          if isSquare(board: board, position: position, length: length) {
            answer = length * length
            break
          }
        }
      }
      
      if answer != nil {
        break
      }
    }
    
    if answer != nil {
      break
    }
  }
  
  return answer ?? 0
}

func canSqaure(board: [[Int]], position: (Int, Int), length: Int) -> Bool {
  let canWidth = board.count - position.0 > length - 1
  let canHeight = board.first!.count - position.1 > length - 1
  return canWidth && canHeight
}

func isSquare(board: [[Int]], position: (Int, Int), length: Int) -> Bool {
  if board[position.0 + length - 1][position.1 + length - 1] == 0 {
    return false
  }
  
  if board[position.0 + length - 1][position.1] == 0 {
    return false
  }
  
  return !board[position.0 + 0...position.0 + length - 1]
    .contains(where: {
      $0[position.1 + 0...position.1 + length - 1].contains(0)
    })
}

print(solution([[0,1,1,1],[1,1,1,1],[1,1,1,1],[0,0,1,0]])) // 9
print(solution([[0,0,1,1],[1,1,1,1]])) // 4
print(solution([[1, 0],[0, 0]])) // 1

