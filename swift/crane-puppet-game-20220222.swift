// https://programmers.co.kr/learn/courses/30/lessons/64061

/**
 */

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
  var board = relocate(board: board)
  var movedItems = [Int]()
  var count = 0
  
  moves.forEach {
    if board[$0 - 1].isEmpty {
      return
    }
    
    let moved = board[$0 - 1].removeFirst()
    
    if movedItems.last == moved {
      movedItems.removeLast()
      count += 2
      return
    }
    
    movedItems.append(moved)
  }
  
  return count
}

func relocate(board: [[Int]]) -> [[Int]] {
  (0...(board.count - 1)).reduce([[Int]]()) { result, num in
    result + [
      board.reduce([Int]()) {
        $1[num] == 0 ? $0 : $0 + [$1[num]]
      }
    ]
  }
}

print(solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4])) // 4

