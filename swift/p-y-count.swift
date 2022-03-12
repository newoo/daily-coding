// https://programmers.co.kr/learn/courses/30/lessons/12916

/**
 */

import Foundation

func solution(_ s:String) -> Bool {
  getCountAlphabet("p", s: s) == getCountAlphabet("y", s: s)
}

func getCountAlphabet(_ alphabet: String, s: String) -> Int {
  s.filter { $0.lowercased() == alphabet }.count
}

print(solution("pPoooyY")) // true
print(solution("Pyy")) // false

