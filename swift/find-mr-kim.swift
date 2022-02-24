// https://programmers.co.kr/learn/courses/30/lessons/12919

/**
 */

import Foundation

func solution(_ seoul:[String]) -> String {
  "김서방은 \(seoul.firstIndex(of: "Kim")!)에 있다"
}

print(solution(["Jane", "Kim"])) // "김서방은 1에 있다"

