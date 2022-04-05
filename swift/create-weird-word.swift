// https://programmers.co.kr/learn/courses/30/lessons/12930

/**
 */

import Foundation

func solution(_ s:String) -> String {
  s.components(separatedBy: " ").map {
    Array($0).enumerated().map { char in
      char.offset % 2 == 0
        ? char.element.uppercased()
        : char.element.lowercased()
    }.joined()
  }.joined(separator: " ")
}

print(solution("try hello world")) // "TrY HeLlO WoRlD"

