import Foundation

func compare(choices: [Int], and answers: [Int]) -> Int {
  let filtered = answers.enumerated().filter { offset, answer in
    let index = offset >= choices.count
      ? offset % choices.count
      : offset
    
    return choices[index] == answer
  }
  
  return filtered.count
}

func solution(_ answers:[Int]) -> [Int] {
  let choices = [
    [1, 2, 3, 4, 5],
    [2, 1, 2, 3, 2, 4, 2, 5],
    [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
  ].map { compare(choices: $0, and: answers) }
  
  guard let max = choices.max(), max > 0 else {
    return []
  }
  
  return choices.enumerated()
    .filter { $0.element == max }
    .map { $0.offset + 1 }
}
