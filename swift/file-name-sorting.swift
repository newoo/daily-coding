// https://programmers.co.kr/learn/courses/30/lessons/17686

/**
 */

import Foundation

struct FileName: Comparable {
  let text: String
  let head: String
  let number: Int
  let offset: Int
  
  init(file: String, offset: Int) {
    self.text = file
    let fileArr = file.lowercased().map { String($0) }
    self.offset = offset
    
    var head = ""
    var number = ""
    
    for text in fileArr {
      if Int(text) == nil {
        if number.isEmpty {
          head += text
          continue
        }
        
        break
      }
      
      if !head.isEmpty {
        number += text
        continue
      }
      
      break
    }
    
    self.head = head
    self.number = Int(number)!
  }
  
  static func < (lhs: FileName, rhs: FileName) -> Bool {
    if lhs.head != rhs.head {
      return lhs.head < rhs.head
    }
    
    if lhs.number != rhs.number {
      return lhs.number < rhs.number
    }
    
    return lhs.offset < rhs.offset
  }
}

func solution(_ files:[String]) -> [String] {
  files.enumerated()
    .map { FileName(file: $0.element, offset: $0.offset) }
    .sorted()
    .map(\.text)
}

print(solution(["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"])) // ["img1.png", "IMG01.GIF", "img02.png", "img2.JPG", "img10.png", "img12.png"]
print(solution(["F-5 Freedom Fighter", "B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat"])) // ["A-10 Thunderbolt II", "B-50 Superfortress", "F-5 Freedom Fighter", "F-14 Tomcat"]

