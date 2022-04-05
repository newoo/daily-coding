// https://programmers.co.kr/learn/courses/30/lessons/42889

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
  var arr = Array(repeating: 0, count: N + 2)
  var count = stages.count
  
  stages.forEach {
    arr[$0] += 1
  }
  
  return arr.enumerated().filter { !($0.offset == 0 || $0.offset == (N + 1)) }
    .map { t -> (offset: Int, element: Double) in
      let newElement = Double(t.element) / Double(count)
      count = count - t.element

      return (offset: t.offset, element: newElement)
    }.sorted(by: { $0.element > $1.element })
    .map { $0.offset }
}

print(solution(5, [2, 1, 2, 6, 2, 4, 3, 3])) // [3,4,2,1,5]
print(solution(4, [4,4,4,4,4])) // [4,1,2,3]

