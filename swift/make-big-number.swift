// https://programmers.co.kr/learn/courses/30/lessons/42883

/**
 
 */

func solution(_ number:String, _ k:Int) -> String {
    let number = number.map { String($0) }
    
    let arr = Array(number.compactMap { Int($0) }[0...k])
    let max = arr.max()
    
    let droppped = arr.enumerated()
        .filter { $0.element == max }
        .map { enumerated -> Int in
            let _number = Array(number[enumerated.offset...])
            return drop(number: _number, k: k - enumerated.offset, index: 1, dropped: _number)
                .filter { !$0.isEmpty }
                .map { $0.joined() }
                .compactMap { Int($0) }
                .max() ?? 0
        }.max() ?? 0
    
    return String(droppped)
}

func drop(number: [String], k: Int, index: Int, dropped: [String]) -> [[String]] {
    if k == 0 {
        return [dropped]
    }
    
    if index == number.count {
        return [[]]
    }
    
    var _dropped = dropped
    _dropped[index] = ""
    
    let selected = drop(number: number, k: k - 1, index: index + 1, dropped: _dropped)
    let unselected = drop(number: number, k: k, index: index + 1, dropped: dropped)
    
    return selected + unselected
}


print(solution("1924", 2)) // 94
print(solution("1231234", 3)) // 3234
print(solution("4177252841", 4)) // 775841
