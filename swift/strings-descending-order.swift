// https://programmers.co.kr/learn/courses/30/lessons/12917

/**
 */

import Foundation

func solution(_ s:String) -> String {
  s.sorted(by: >).map { String($0) }.joined()
}

print(solution("Zbcdefg")) // gfedcbZ

