// https://programmers.co.kr/learn/courses/30/lessons/67258

/**
 */

import Foundation

func solution(_ gems:[String]) -> [Int] {
  let count = Set(gems).count
  var dic = [String: Int]()

  for (offset, gem) in gems.enumerated() {
    if dic.count == count {
      break
    }

    dic[gem] = offset + 1
  }

  let values = dic.values

  return [values.min()!, values.max()!]
}

print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"])) // [3, 7]
print(solution(["AA", "AB", "AC", "AA", "AC"])) // [1, 3]
print(solution(["XYZ", "XYZ", "XYZ"])) // [1, 1]
print(solution(["ZZZ", "YYY", "NNNN", "YYY", "BBB"])) // [1, 5]

