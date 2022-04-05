//: [Previous](@previous)

// https://programmers.co.kr/learn/courses/30/lessons/67258

/**
 효율성 테스트 몇 개 통과 못 함
 */

import Foundation

func solution(_ gems:[String]) -> [Int] {
  let count = Set(gems).count
  var dic = [String: Int]()
  
  var arr = [[Int]]()
  
  gems.enumerated().forEach {
    dic[$0.element] = $0.offset + 1
    
    if dic.count == count {
      let values = dic.values
      arr.append([values.min()!, values.max()!])
    }
  }
  
  return arr.min(by: { ($0.last! - $0.first!) < ($1.last! - $1.first!) }) ?? []
}

print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"])) // [3, 7]
print(solution(["AA", "AB", "AC", "AA", "AC"])) // [1, 3]
print(solution(["XYZ", "XYZ", "XYZ"])) // [1, 1]
print(solution(["ZZZ", "YYY", "NNNN", "YYY", "BBB"])) // [1, 5]

//: [Next](@next)
