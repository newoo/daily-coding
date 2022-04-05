// https://programmers.co.kr/learn/courses/30/lessons/76501

import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
  absolutes.enumerated().reduce(0) { result, absolute in
    result + (absolute.element * (signs[absolute.offset] ? 1 : -1))
  }
}

print(solution([4,7,12], [true,false,true])) // 9
print(solution([1,2,3], [false,false,true])) // 0

