// https://programmers.co.kr/learn/courses/30/lessons/60059

/**
 - lock 빈 공간 좌표 배열 만들기
 - key 회전
 - key를 움직이며 lock의 빈 공간을 채울 수 있는지 체크
 */

import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
  var blocks = fineBlocks(key: key)
  let spaces = fineSpaces(lock: lock)
  
  var result = false
  
  for i in (0...3) {
    if i > 0 {
      blocks = rotate(blocks: blocks, max: key.count - 1)
    }
    
    if check(blocks: blocks, spaces: spaces) {
      result = true
      break
    }
  }
  
  return result
}

func fineBlocks(key: [[Int]]) -> [(Int, Int)] {
  key.enumerated().reduce([(Int, Int)]()) { result, arr in
    result + arr.element.enumerated().reduce([(Int, Int)]()) { _result, num in
      num.element == 1 ? _result + [(arr.offset, num.offset)] : _result
    }
  }
}

func fineSpaces(lock: [[Int]]) -> [(Int, Int)] {
  lock.enumerated().reduce([(Int, Int)]()) { result, arr in
    result + arr.element.enumerated().reduce([(Int, Int)]()) { _result, num in
      num.element == 0 ? _result + [(arr.offset, num.offset)] : _result
    }
  }
}

func rotate(blocks: [(Int, Int)], max: Int) -> [(Int, Int)] {
  blocks.map { ($0.1, max - $0.0) }
}

//func rotate(key: [[Int]]) -> [[Int]] {
//  (0...(key.count - 1)).reduce([[Int]]()) { result, row in
//    result + [(0...(key.count - 1)).reversed().reduce([Int]()) { _result, col in
//      _result + [key[col][row]]
//    }]
//  }
//}

func check(blocks: [(Int, Int)], spaces: [(Int, Int)]) -> Bool {
  let adding = spaces.reduce([(Int, Int)]()) { result, space in
    result + [(space.0 - blocks.first!.0, space.1 - blocks.first!.1)]
  }
  
  var count = 0
  var result = false
  
  for add in adding {
    for space in spaces {
      if blocks.contains(where: { block in
        (block.0 + add.0) == space.0 && (block.1 + add.1) == space.1
      }) {
        count += 1
      }
      
      break
    }
    
    if count == spaces.count {
      result = true
      break
    }
  }

  return result
}

print(solution([[0, 0, 0], [1, 0, 0], [0, 1, 1]], [[1, 1, 1], [1, 1, 0], [1, 0, 1]])) // true

