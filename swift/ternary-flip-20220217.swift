// https://programmers.co.kr/learn/courses/30/lessons/68935

/**
 -
 */

import Foundation

func solution(_ n:Int) -> Int {
  toDecimal(from: toTernary(from: n))
}

func toTernary(from num: Int) -> [Int] {
  num < 3 ? [num] : toTernary(from: num / 3) + [num % 3]
}

func toDecimal(from nums: [Int]) -> Int {
  nums.enumerated().reduce(0) {
    print($0, $1)
    return $0 + Int(pow(3, Double($1.offset))) * $1.element
  }
}

print(solution(45)) // 7
print(solution(125)) // 229

