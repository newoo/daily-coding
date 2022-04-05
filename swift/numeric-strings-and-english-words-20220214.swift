// https://programmers.co.kr/learn/courses/30/lessons/81301

/**
 - 첫 글자 혹은 첫글자와 두번째글자를 가지고 숫자를 추측
 */

import Foundation

let numberDic = [
  "zero": "0", "one": "1", "two": "2", "three": "3", "four": "4",
  "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"
]

func solution(_ s:String) -> Int {
  Int(makeResult(text: s)) ?? 0
}

func makeResult(text: String) -> String {
  if let prefixNumber = numberDic.first(where: { text.hasPrefix($0.key) }) {
    return prefixNumber.value
      + makeResult(text: String(text.dropFirst(prefixNumber.key.count)))
  }
  
  if text.first?.wholeNumberValue != nil {
    return String(text.first!) + makeResult(text: String(text.dropFirst(1)))
  }
  
  return ""
}

print(solution("one4seveneight")) // 1478
print(solution("23four5six7")) // 234567
print(solution("2three45sixseven")) // 234567
print(solution("123")) // 123

