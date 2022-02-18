// https://programmers.co.kr/learn/courses/30/lessons/70128

/**
 -
 */

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
  (0...(a.count - 1)).reduce(0) {
    $0 + a[$1] * b[$1]
  }
}

print(solution([1,2,3,4], [-3,-1,0,2])) // 3
print(solution([-1,0,1], [1,0,-1])) // -2

