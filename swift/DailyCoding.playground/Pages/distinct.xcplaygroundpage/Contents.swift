//: [Previous](@previous)

import Foundation

public func solution(_ A:[Int]) -> Int {
  guard A.count > 0 else {
    return 0
  }
  
  let max = A.max() ?? 0

  var countArray = [Int](repeating: 0, count: Int(max + 1))

  A.forEach {
    countArray[$0] += 1
  }

  return countArray.enumerated().first(where: { $1 == 1 })?.offset ?? 0
}

print(solution([2, 1, 1, 2, 3, 1]))


//: [Next](@next)
