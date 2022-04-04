// https://programmers.co.kr/learn/courses/30/lessons/17682

/**
 */

import Foundation

func solution(_ dartResult:String) -> Int {
  dartResult.map { String($0) }
    .reduce([String]()) {
      if $0.last == "1", $1 == "0" {
        return $0.dropLast() + ["10"]
      }
      
      return $0 + [$1]
    }.reduce([Int]()) { calc(arr: $0, symbol: $1) }
    .reduce(0, +)
}

func calc(arr: [Int], symbol: String) -> [Int] {
  if let number = Int(symbol) {
    return arr + [number]
  }
  
  guard let last = arr.last else { return arr }
  
  var arr = arr
  
  switch symbol {
  case "D":
    arr[arr.endIndex - 1] = last * last
    
  case "T":
    arr[arr.endIndex - 1] = last * last * last
    
  case "*":
    arr[arr.endIndex - 1] = last * 2
    
    if arr.count > 1 {
      arr[arr.endIndex - 2] = arr[arr.endIndex - 2] * 2
    }
    
  case "#":
    arr[arr.endIndex - 1] = -last
    
  default:
    break
  }
  
  return arr
}

print(solution("1S2D*3T")) // 37
print(solution("1D2S#10S")) // 9
print(solution("1D2S0T")) // 3
print(solution("1S*2T*3S")) // 23
print(solution("1D#2S*3S")) // 5
print(solution("1T2D3D#")) // -4
print(solution("1D2S3T*")) // 59

