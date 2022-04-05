// https://programmers.co.kr/learn/courses/30/lessons/82612

/**
 */

import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
  max(Int64((1...count).map { $0 * price }.reduce(0, +) - money), 0)
}

print(solution(3, 20, 4)) // 10

