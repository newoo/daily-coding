// https://programmers.co.kr/learn/courses/30/lessons/60058

import Foundation

func solution(_ p:String) -> String {
  reorder(symbols: p)
}

func getAdding(by symbol: String) -> Int {
  switch symbol {
  case "(":
    return 1
    
  case ")":
    return -1
    
  default:
    return 0
  }
}

func isCorrect(symbols: String) -> Bool {
  symbols.first == "("
}

func reorder(symbols: String) -> String {
  if symbols.isEmpty {
    return ""
  }
  
  var v = symbols
  var u = ""
  var count = 0
  
  for symbol in symbols {
    count += getAdding(by: "\(symbol)")
    u = u + "\(symbol)"
    v.removeFirst()
    
    if count == 0 {
      break
    }
  }
  
  if isCorrect(symbols: u) {
    return u + reorder(symbols: v)
  } else {
    u.removeFirst()
    u.removeLast()
    return "(" + reorder(symbols: v) + ")" + doSwitching(symbols: u)
  }
}

func doSwitching(symbols: String) -> String {
  symbols.map { symbol -> String in
    if symbol == "(" {
      return ")"
    }

    if symbol == ")" {
      return "("
    }
    
    return "\(symbol)"
  }.reduce("", +)
}

print(solution("(()())()")) // "(()())()"
print(solution(")(")) // "()"
print(solution("()))((()")) // "()(())()"

