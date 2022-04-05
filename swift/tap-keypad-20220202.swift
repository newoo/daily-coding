import Foundation

/**
 
 https://programmers.co.kr/learn/courses/30/lessons/67256
 
 */

func solution(_ numbers:[Int], _ hand:String) -> String {
  check(numbers: convert(numbers: numbers), hand: hand)
}

func convert(numbers: [Int]) -> [(number: Int, x: Int, y: Int)] {
  numbers.map { number in
    let divided = number / 3
    let left = number % 3
    
    return number == 0
      ? (number: number, x: 2, y: 4)
      : (number: number,
         x: left == 0 ? 3 : left,
         y: divided + (left == 0 ? 0 : 1))
  }
}

func check(numbers: [(number: Int, x: Int, y: Int)], hand: String) -> String {
  let _hand = hand == "right" ? "R" : "L"
  var leftPosition = (x: 1, y: 4)
  var rightPosition = (x: 3, y: 4)
  
  return numbers.reduce("") { result, number in
    if number.x == 1 {
      leftPosition = (x: number.x, y: number.y)
      return result + "L"
    }
    
    if number.x == 3 {
      rightPosition = (x: number.x, y: number.y)
      return result + "R"
    }
    
    if number.x == 2 {
      let leftDistance = abs((number.x - leftPosition.x)) + abs((number.y - leftPosition.y))
      let rightDistance = abs((number.x - rightPosition.x)) + abs((number.y - rightPosition.y))
  
      if leftDistance < rightDistance {
        leftPosition = (x: number.x, y: number.y)
        return result + "L"
      } else if leftDistance > rightDistance {
        rightPosition = (x: number.x, y: number.y)
        return result + "R"
      } else {
        if _hand == "L" {
          leftPosition = (x: number.x, y: number.y)
        }
        
        if _hand == "R" {
          rightPosition = (x: number.x, y: number.y)
        }
        
        return result + _hand
      }
    }
    
    return result
  }
}

print(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right")) // LRLLLRLLRRL
print(solution([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2], "left")) // LRLLRRLLLRR
print(solution([1, 2, 3, 4, 5, 6, 7, 8, 9, 0], "right")) // LLRLLRLLRL

