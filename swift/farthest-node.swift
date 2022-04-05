

// https://programmers.co.kr/learn/courses/30/lessons/49189

import UIKit

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph = Dictionary.init(uniqueKeysWithValues: (1...n).map { ($0, [Int]()) })
    edge.forEach {
        graph[$0.first!] = graph[$0.first!]! + [$0.last!]
        graph[$0.last!] = graph[$0.last!]! + [$0.first!]
    }
    
    var visited = Set<Int>()
    var currentNodes: Set<Int> = [1]
    
    while visited.count < n {
        let arr = currentNodes.compactMap { graph[$0] }.flatMap { $0 }
        visited.formUnion(currentNodes)
        
        if visited.count < n {
            currentNodes = Set(arr).filter { !visited.contains($0) }
        }
    }
    
    return currentNodes.count
}

print(solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]])) // 3
