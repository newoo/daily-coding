// https://programmers.co.kr/learn/courses/30/lessons/64065?language=swift

import Foundation

func solution(_ s:String) -> [Int] {
    var last = 0
    var arr = [Int]()
    
    String(s.dropFirst(2).dropLast(2))
        .components(separatedBy: "},{")
        .map { $0.components(separatedBy: ",").compactMap { Int($0) }.reduce(0, +) }
        .sorted()
        .forEach {
            arr.append($0 - last)
            last = $0
        }
    
    return arr
}
