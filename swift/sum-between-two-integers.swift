// https://programmers.co.kr/learn/courses/30/lessons/12912

/**
 */

import Foundation

func solution(_ a:Int, _ b:Int) -> Int64 {
  Int64((min(a, b)...max(a, b)).reduce(0, +))
}

print(solution(3, 5)) // 12
print(solution(3, 3)) // 3
print(solution(5, 3)) // 12

