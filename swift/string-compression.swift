// https://programmers.co.kr/learn/courses/30/lessons/60057

/**
 - 첫 글자 혹은 첫글자와 두번째글자를 가지고 숫자를 추측
 */

import Foundation

func solution(_ s:String) -> Int {
  (1...max(s.count / 2, 1)).reduce([s]) {
    $0 + [buildText(s, number: $1)]
  }.min(by: { $0.count < $1.count })?.count ?? s.count
}

func buildText(_ text: String, number: Int) -> String {
  var arr = split(text: text, number: number)
  var result = ""
  
  while !arr.isEmpty {
    let chuck = arr.first!
    let (_arr, count) = remove(arr: arr, chuck: chuck)
    arr = _arr
    result = result + (count > 1 ? "\(count)" : "") + chuck
  }
  
  return result
}

func split(text: String, number: Int) -> [String] {
  stride(from: 0, to: text.count, by: number).map {
    let start = text.index(text.startIndex, offsetBy: $0)
    let end = text.index(start, offsetBy: number, limitedBy: text.endIndex) ?? text.endIndex
    return String(text[start..<end])
  }
}

func remove(arr: [String], chuck: String) -> ([String], Int) {
  var arr = arr
  var count = 0
  
  while !arr.isEmpty {
    guard arr.first == chuck else {
      break
    }
    
    arr.removeFirst()
    count += 1
  }
  
  return (arr, count)
}

print(solution("aabbaccc")) // 7
print(solution("ababcdcdababcdcd")) // 9
print(solution("abcabcdede")) // 8
print(solution("abcabcabcabcdededededede")) // 14
print(solution("xababcdcdababcdcd")) // 17
print(solution("a")) // 17

