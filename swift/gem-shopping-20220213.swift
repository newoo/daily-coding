// https://programmers.co.kr/learn/courses/30/lessons/67258

/**
 */

import Foundation

func solution(_ gems:[String]) -> [Int] {
  var gemsDic = Dictionary(uniqueKeysWithValues: Set(gems).map{ ($0, -1) })
  var gemsDicArr = [[String: Int]]()
  
  gems.enumerated().forEach { offset, gem in
    gemsDic[gem] = offset
    
    if gemsDic.contains(where: { $0.value < 0 }) {
      return
    }
    
    gemsDicArr.append(gemsDic)
  }
  
  return gemsDicArr.compactMap { [$0.values.min()! + 1, $0.values.max()! + 1] as [Int] }
    .min(by: { ($0.last! - $0.first!) < ($1.last! - $1.first!) })!
}

print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"])) // [3, 7]
print(solution(["AA", "AB", "AC", "AA", "AC"])) // [1, 3]
print(solution(["XYZ", "XYZ", "XYZ"])) // [1, 1]
print(solution(["ZZZ", "YYY", "NNNN", "YYY", "BBB"])) // [1, 5]

