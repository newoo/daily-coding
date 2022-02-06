// https://programmers.co.kr/learn/courses/30/lessons/12973

import Foundation

func solution(_ s:String) -> Int{
  deleteAll(in: Array(s)) ? 1 : 0
}

func deleteAll(in alphabets: [Character]) -> Bool {
  var _alphabets = [Character]()
  
  for alphabet in alphabets {
    if _alphabets.last == alphabet {
      _alphabets.removeLast()
      continue
    }
    
    _alphabets.append(alphabet)
  }
  
  return _alphabets.isEmpty
}

//func deleteAll(in alphabets: [String]) -> Bool {
//  let _alphabets = alphabets.reduce([String]()) { arr, alphabet in
//    var arr = arr
//
//    if arr.last == alphabet {
//      arr.removeLast()
//      return arr
//    }
//
//    arr.append(alphabet)
//    return arr
//  }
//
//  if _alphabets.count == alphabets.count {
//    return false
//  }
//
//  if _alphabets.count == 0 {
//    return true
//  }
//
//  return deleteAll(in: _alphabets)
//}

print(solution("baabaa")) // 1
print(solution("cdcd")) // 0

