// https://programmers.co.kr/learn/courses/30/lessons/12981

/**
 */

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
  var passed = Set<String>()
  var lastChar = words.first!.map { String($0) }.first!
  
  var result = [0, 0]
  
  for (offset, word) in words.enumerated() {
    guard lastChar == word.map({ String($0) }).first else {
      result = [offset % n + 1, offset / n + 1]
      break
    }
    
    if passed.contains(word) {
      result = [offset % n + 1, offset / n + 1]
      break
    }
    
    passed.insert(word)
    lastChar = word.map { String($0) }.last!
  }
  
  return result
}

print(solution(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"])) // [3,3]
print(solution(5, ["hello", "observe", "effect", "take", "either", "recognize", "encourage", "ensure", "establish", "hang", "gather", "refer", "reference", "estimate", "executive"])) // [0,0]
print(solution(2, ["hello", "one", "even", "never", "now", "world", "draw"])) // [1,3]

