// https://programmers.co.kr/learn/courses/30/lessons/12918

/**
 */

import Foundation

func solution(_ s:String) -> Bool {
  Int(s) != nil && [4, 6].contains(s.count)
}

print(solution("a234")) // false
print(solution("1234")) // true

