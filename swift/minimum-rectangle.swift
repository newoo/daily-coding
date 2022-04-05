// https://programmers.co.kr/learn/courses/30/lessons/86491

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
  var width = 1
  var height = 1
  
  sizes.forEach {
    width = max(width, $0.max()!)
    height = max(height, $0.min()!)
  }
  
  return width * height
}

print(solution([[60, 50], [30, 70], [60, 30], [80, 40]])) // 4000
print(solution([[10, 7], [12, 3], [8, 15], [14, 7], [5, 15]])) // 120
print(solution([[14, 4], [19, 6], [6, 16], [18, 7], [7, 11]])) // 133

