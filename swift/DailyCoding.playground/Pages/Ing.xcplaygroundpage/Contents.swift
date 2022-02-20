//: [Previous](@previous)

// https://programmers.co.kr/learn/courses/30/lessons/60059

/**
 - lock 빈 공간 좌표 배열 만들기
 - key 회전
 - key를 움직이며 lock의 빈 공간을 채울 수 있는지 체크
 */

import Foundation

func solution(_ board:[[Int]]) -> Int {
  return searchNext(position: (0, 0), direction: true, in: board) - 100
}

func searchNext(position: (Int, Int), direction: Bool, in board: [[Int]]) -> Int {
  if position.0 > (board.count - 1) || position.1 > (board.count - 1) {
    return 0
  }
  
  if board[position.0][position.1] == 1 {
    print("======", position)
    return 0
  }
  
  let right = searchNext(position: (position.0 + 1, position.1), direction: true, in: board)
  let down = searchNext(position: (position.0, position.1 + 1), direction: false, in: board)
  
  if right == 0 {
    return 100 + down + (direction ? 500 : 0)
  }
  
  if down == 0 {
    return 100 + right + (direction ? 0 : 500)
  }
  
  return 100 + min(right + (direction ? 0 : 500), down + (direction ? 500 : 0))
}


print(solution([[0,0],[0,0]])) // 700
print(solution([[0,0,0],[0,0,0],[0,0,0]])) // 900
print(solution([[0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0],[0,0,0,0,0,1,0,0],[0,0,0,0,1,0,0,0],[0,0,0,1,0,0,0,1],[0,0,1,0,0,0,1,0],[0,1,0,0,0,1,0,0],[1,0,0,0,0,0,0,0]])) // 3800
//print(solution([[0,0,1,0],[0,0,0,0],[0,1,0,1],[1,0,0,0]])) // 2100
//print(solution([[0,0,0,0,0,0],[0,1,1,1,1,0],[0,0,1,0,0,0],[1,0,0,1,0,1],[0,1,0,0,0,1],[0,0,0,0,0,0]])) // 3200

//: [Next](@next)
