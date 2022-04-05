import Foundation

/**
 
 */

func solution(_ numbers:String) -> Int {
  getCases(by: numbers).filter { isPrime(number: $0) }.count
}

func getCases(by numbers: String) -> [Int] {
  let arr = numbers.compactMap { $0.wholeNumberValue }
  
  var result = [Int]()
  
  (1...numbers.count).forEach {
    if $0 == 1 {
      result.append(contentsOf: arr)
    }
    
    if $0 == 2 {
      result.append(arr[0] * 10 + arr[1])
      result.append(arr[1] * 10 + arr[0])
    }
  }
  
  return result
}

func isPrime(number: Int) -> Bool {
  if number < 2 {
    return false
  }
  
  if number < 4 {
    return true
  }
  
  if number % 2 == 0 {
    return false
  }
  
  var result = true
  
  for i in (3...(number / 2)) {
    if number % i == 0 {
      result = false
      break
    }
  }
  
  return result
}

print(solution("17")) // 3
print(solution("011")) // 2

