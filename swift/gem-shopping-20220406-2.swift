// https://programmers.co.kr/learn/courses/30/lessons/67258

/**
 */

import Foundation

func solution(_ gems:[String]) -> [Int] {
  var dic = Dictionary(uniqueKeysWithValues: Set(gems).map { ($0, [Int]()) })

  gems.enumerated().forEach {
    dic[$0.element] = dic[$0.element, default: []] + [$0.offset]
  }

  var _dic = Dictionary(uniqueKeysWithValues: dic.map { ($0.key, ($0.value.min()!, $0.value.max()!)) })

  print(_dic)

  let r = _dic.reduce([0, gems.endIndex]) {

    print("min max", _min, _max)

    return [_min, _max]
  }

  return []
}

print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"])) // [3, 7]
print(solution(["AA", "AB", "AC", "AA", "AC"])) // [1, 3]
print(solution(["XYZ", "XYZ", "XYZ"])) // [1, 1]
print(solution(["ZZZ", "YYY", "NNNN", "YYY", "BBB"])) // [1, 5]

