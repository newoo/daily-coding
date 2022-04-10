import Foundation

// 참고 - https://haningya.tistory.com/374

// MARK: - 그래프

let graph = [
    "A": ["B","C"],
    "B": ["A","D"],
    "C": ["A","G","H","I"],
    "D": ["D","B","E","F"],
    "E": ["E","D"],
    "F": ["F","D"],
    "G": ["G","C"],
    "H": ["H","C"],
    "I": ["I","C","J"],
    "J": ["J","I"],
]

// MARK: - BFS
// 큐 + 큐
func bfs(graph : [String: [String]], from start: String) -> [String] {
    var willVisit = [start] // 큐
    var didVisit = [String]() // 큐
    
    while !willVisit.isEmpty {
        let next = willVisit.removeFirst()
        
        if !didVisit.contains(next) {
            didVisit.append(next)
            willVisit.append(contentsOf: graph[next, default: []])
        }
    }
    
    return didVisit
}

print(bfs(graph: graph, from: "A"))

// MARK: - DFS
// 스택 + 큐
func dfs(graph : [String: [String]], from start: String) -> [String] {
    var willVisit = [start] // 스택
    var didVisit = [String]() // 큐
    
    while !willVisit.isEmpty {
        let next = willVisit.removeLast()
        
        if !didVisit.contains(next) {
            didVisit.append(next)
            willVisit.append(contentsOf: graph[next, default: []])
        }
    }
    
    return didVisit
}

print(dfs(graph: graph, from: "A"))
