// https://programmers.co.kr/learn/courses/30/lessons/12951

/**
 */

import Foundation

func solution(_ s:String) -> String {
  s.lowercased()
    .components(separatedBy: " ")
    .map { $0.prefix(1).uppercased() + String($0.dropFirst()) }
    .joined(separator: " ")
}

print(solution("3people unFollowed me")) // "3people Unfollowed Me"
print(solution("for the last week")) // "For The Last Week"

