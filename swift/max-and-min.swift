// https://programmers.co.kr/learn/courses/30/lessons/12939

/**
 */

import Foundation

func solution(_ s:String) -> String {
  let arr = s.components(separatedBy: " ").compactMap { Int($0) }
  return "\(arr.min()!) \(arr.max()!)"
}

print(solution("1 2 3 4")) // "1 4"
print(solution("-1 -2 -3 -4")) // "-4 -1"
print(solution("-1 -1")) // "-1 -1

