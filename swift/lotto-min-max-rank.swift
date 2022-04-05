import Foundation

/**
 
 https://programmers.co.kr/learn/courses/30/lessons/77484
 
 */

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
  let (minMatchCount, leftLottosCount) = minMatch(lottos: lottos, winNums: win_nums)
  let maxRank = min(7 - (leftLottosCount + minMatchCount), 6)
  let minRank = min(7 - minMatchCount, 6)
  return [maxRank, minRank]
}

func minMatch(lottos: [Int], winNums: [Int]) -> (matchCount: Int, leftLottosCount: Int) {
  var leftLottosCount = 0
  var leftWinNums = winNums
  
  lottos.forEach { lottoNumber in
    if lottoNumber == 0 {
      leftLottosCount += 1
      return
    }
    
    if winNums.contains(lottoNumber) {
      leftWinNums.removeAll(where: { $0 == lottoNumber })
    }
  }
  
  return (matchCount: 6 - leftWinNums.count, leftLottosCount: leftLottosCount)
}

print(solution([44, 1, 0, 0, 31, 25], [31, 10, 45, 1, 6, 19])) // [3, 5]
print(solution([0, 0, 0, 0, 0, 0], [38, 19, 20, 40, 15, 25])) // [1, 6]
print(solution([45, 4, 35, 20, 3, 9], [20, 9, 3, 45, 4, 35])) // [1, 1]
print(solution([1, 2, 3, 4, 5, 6], [38, 19, 20, 40, 15, 25])) // [6, 6]

