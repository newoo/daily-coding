//: [Previous](@previous)

import Foundation

/**
 
 https://programmers.co.kr/learn/courses/30/lessons/62048
 
 */

func solution(_ w:Int, _ h:Int) -> Int64{
  var answer:Int64 = 0
  checkThrough(w: w, h: h)
  return answer
}

func checkThrough(w: Int, h: Int) -> Int {
  var count = 0
  var through
  
  let fx = Double(w) / Double(h)
  
  (0...h).forEach { i in
    if i == 0 {
      count += 1
      return
    }
    
    print(Double(i) * fx as? Int)
  }
  
  return 0
}

print(solution(2, 3)) // 2
//print(solution(8, 12)) // 80
//: [Next](@next)
