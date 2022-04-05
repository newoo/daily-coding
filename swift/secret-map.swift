// https://programmers.co.kr/learn/courses/30/lessons/17681

/**
 */

import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
  return zip(arr1.map { convert(from: $0, length: n) }, arr2.map { convert(from: $0, length: n) })
    .map { merge($0.0, $0.1) }
}

func convert(from number: Int, length: Int) -> [String] {
  var converted = String(number, radix: 2).map { $0 == "1" ? "#" : " " }
  
  while converted.count < length {
    converted.insert(" ", at: 0)
  }
  
  return converted
}

func merge(_ lhs: [String], _ rhs: [String]) -> String {
  zip(lhs, rhs).map { $0.0 == "#" || $0.1 == "#" ? "#" : " " }.joined()
}
 


print(solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28])) // ["#####","# # #", "### #", "# ##", "#####"]
print(solution(6, [46, 33, 33 ,22, 31, 50], [27 ,56, 19, 14, 14, 10])) // ["######", "### #", "## ##", " #### ", " #####", "### # "]

