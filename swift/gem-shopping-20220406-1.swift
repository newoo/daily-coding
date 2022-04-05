// https://programmers.co.kr/learn/courses/30/lessons/67258

/**
 */

import Foundation

func solution(_ gems:[String]) -> [Int] {
  let guide = Set(gems)
  var result = [1, gems.endIndex]

  (1...gems.endIndex).forEach { startIdx in
    let endIdx = findEnd(gems: Array(gems[(startIdx - 1)...]),
                         length: guide.count,
                         idx: startIdx - 1,
                         guide: Set<String>())

    let current = result.last! - result.first!

    if endIdx > 0, current > endIdx - startIdx {
      result = [startIdx, endIdx]
    }
  }

  return result
}

func findEnd(gems: [String], length: Int, idx: Int, guide: Set<String>) -> Int {
  if gems.isEmpty {
    return 0
  }

  if guide.count == length {
    return idx
  }

  var guide = guide
  guide.insert(gems.first!)

  return findEnd(gems: Array(gems.dropFirst()),
                 length: length,
                 idx: idx + 1,
                 guide: guide)
}


print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"])) // [3, 7]
print(solution(["AA", "AB", "AC", "AA", "AC"])) // [1, 3]
print(solution(["XYZ", "XYZ", "XYZ"])) // [1, 1]
print(solution(["ZZZ", "YYY", "NNNN", "YYY", "BBB"])) // [1, 5]

