
// https://programmers.co.kr/learn/courses/30/lessons/49191

/**
 
 */

struct Node {
    let name: Int
    var level: Int?
    var up: [Int] = []
    var down: [Int] = []
    
    mutating func setLevel(_ level: Int = 0) {
        if let _level = self.level, _level >= level {
            return
        }
        
        self.level = level
    }
}

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var boxers = (1...5).map { Node(name: $0) }
    
    results.forEach {
        var winner = boxers[$0.first! - 1]
        var loser = boxers[$0.last! - 1]
        
        winner.down.append($0.last!)
        loser.up.append($0.first!)
        
        boxers[$0.first! - 1] = winner
        boxers[$0.last! - 1] = loser
    }
    
    return 0
}


print(solution(5, [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]])) // 2
