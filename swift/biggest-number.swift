import Foundation

func solution(_ numbers:[Int]) -> String {
  var numbers = numbers
  numbers.sort(by: { compare(lhs: String($0), rhs: String($1)) })
  
  if numbers.first == 0 {
    return "0"
  }
  
  let result = numbers.reduce("") {
    $0 + String($1)
  }
  
  return result
}

func compare(lhs: String, rhs: String) -> Bool{
  guard let _lhs = Int(lhs + rhs), let _rhs = Int(rhs + lhs) else {
    return true
  }
  
  return _lhs > _rhs
}
