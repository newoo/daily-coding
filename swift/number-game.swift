// https://programmers.co.kr/learn/courses/30/lessons/12987

/**
 
 */

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var _b = b.sorted(by: >)
    
    return a.sorted(by: >).reduce(0) {
        if _b.first! > $1 {
            _b.removeFirst()
            return $0 + 1
        }
        
        _b.removeLast()
        return $0
    }
}


print(solution([5,1,3,7], [2,2,6,8])) // 3
print(solution([2,2,2,2], [1,1,1,1])) // 0
