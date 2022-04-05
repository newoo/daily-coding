// https://programmers.co.kr/learn/courses/30/lessons/12913

/**
 */

import Foundation

func solution(_ land:[[Int]]) -> Int {
  step(current: land.first!, next: Array(land.dropFirst())).max()!
}

func step(current: [Int], next: [[Int]]) -> [Int] {
  if next.isEmpty {
    return current
  }

  let _next = next.first!

  let newCurrent: [Int] = _next.enumerated().map {
    var _current = current
    _current.remove(at: $0.offset)
    return $0.element + _current.max()!
  }

  return step(current: newCurrent, next: Array(next.dropFirst()))
}

print(solution([[1,2,3,5],[5,6,7,8],[4,3,2,1]])) // 16

