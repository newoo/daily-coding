
// https://programmers.co.kr/learn/courses/30/lessons/67257

/**
 */

import Foundation

func solution(_ expression:String) -> Int64 {
  let operators = ["*", "+", "-"].filter { op in
    expression.contains(where: { String($0) == op })
  }
  
  return makeCases(in: operators).map {
    Int64(abs(handleExpression(expression, operators: $0)))
  }.max()!
}

func handleExpression(_ expression: String, operators: [String]) -> Int {
  let numbers = expression.components(separatedBy: operators.first!)
  
  return numbers.enumerated().reduce(0) {
    let num = $1.element.contains(where: { e in ["+", "-", "*"].contains(e) })
    ? handleExpression($1.element, operators: Array(operators.dropFirst()))
      : Int($1.element)!
    
    return $1.offset == 0 ? num : rCalc(lhs: $0, rhs: num, op: operators.first!)
  }
}

func rCalc(lhs: Int, rhs: Int, op: String) -> Int {
  switch op {
  case "+":
    return lhs + rhs
    
  case "-":
    return lhs - rhs
    
  case "*":
    return lhs * rhs
    
  default:
    return 0
  }
}

func makeCases(in operators: [String]) -> [[String]] {
  if operators.count == 1 {
    return [operators]
  }
  
  var result = [[String]]()
  
  operators.enumerated().forEach { op in
    var _operators = operators
    _operators.remove(at: op.offset)
    let _case = makeCases(in: _operators).map { [op.element] + $0 }
    result = result + _case
  }
  
  return result
}

print(solution("100-200*300-500+20")) // 60420
print(solution("50*6-3*2")) // 300
print(solution("2*2*2*2*2-2*2*2")) // 24

