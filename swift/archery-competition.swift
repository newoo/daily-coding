// https://programmers.co.kr/learn/courses/30/lessons/92342

/**
 */

import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
  let max = combination(arrow: n, idx: 0, info: info, selected: [])
    .sorted(by: { order($0, $1) })
    .min(by: { match(info, $0) < match(info, $1) })
  
  return match(info, max ?? []) >= 0 ? [-1] : max ?? [-1]
}

func order(_ lhs: [Int], _ rhs: [Int]) -> Bool {
  for element in zip(lhs, rhs).reversed() {
    if element.0 < element.1 {
      return false
    }
    
    if element.0 > element.1 {
      return true
    }
  }
  
  return true
}

func match(_ lhs: [Int], _ rhs: [Int]) -> Int {
  zip(lhs, rhs).reversed()
    .map { $0.0 == 0 && $0.1 == 0 ? 0 : $0.0 - $0.1 < 0 ? -1 : 1 }
    .enumerated()
    .reduce(0) { $0 + $1.offset * $1.element }
}

func combination(arrow: Int, idx: Int, info: [Int], selected: [Int]) -> [[Int]] {
  if arrow <= 0 {
    var selected = selected
    
    while selected.count < 11 {
      selected.append(0)
    }
    
    return [selected]
  }
  
  if idx == info.count {
    return [selected.dropLast() + [arrow]]
  }
  
  let shot = info[idx] + 1
  
  let _unselected = combination(arrow: arrow,
                                idx: idx + 1,
                                info: info,
                                selected: selected + [0])
  let _selected = combination(arrow: arrow - shot,
                              idx: idx + 1,
                              info: info,
                              selected: selected + [shot])
  
  if arrow < shot {
    return _unselected
  }
  
  return _unselected + _selected
}

print(solution(5, [2,1,1,1,0,0,0,0,0,0,0])) // [0,2,2,0,1,0,0,0,0,0,0]
print(solution(1, [1,0,0,0,0,0,0,0,0,0,0])) // [-1]
print(solution(9, [0,0,1,2,0,1,1,1,1,1,1])) // [1,1,2,0,1,2,2,0,0,0,0]
print(solution(10, [0,0,0,0,0,0,0,0,3,4,3])) // [1,1,1,1,1,1,1,1,0,0,2]

