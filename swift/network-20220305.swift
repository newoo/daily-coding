
// https://programmers.co.kr/learn/courses/30/lessons/43162


import UIKit

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    search(computers: computers, left: (1...n).map { $0 })
    
    
    return 0
}

func search(computers: [[Int]], left: [Int]) -> Int {
    if computers.isEmpty {
        return 0
    }
    
    var visited = Set<Int>()
    var queue = [1]
    
    while !queue.isEmpty {
        let first = queue.removeFirst()
        if !visited.contains(first) {
            visited.insert(first)
            print(first - 1)
            queue.append(contentsOf: computers[first - 1].enumerated()
                            .filter { $0.element == 1 }
                            .map{ $0.offset + 1 })
        }
    }
    
    return 1 + search(computers: computers, left: left.filter { !visited.contains($0) })
}

print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]])) // 2
print(solution(3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]])) // 1
