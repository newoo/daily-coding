// https://programmers.co.kr/learn/courses/30/lessons/12950

/**
 */

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
  zip(arr1, arr2).map { zip($0, $1).map(+) }
}

print(solution([[1,2],[2,3]], [[3,4],[5,6]])) // [[4,6],[7,9]]
print(solution([[1],[2]], [[3],[4]])) // [[4],[6]]

