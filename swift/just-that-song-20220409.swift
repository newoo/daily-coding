
// https://programmers.co.kr/learn/courses/30/lessons/17683

// - #이 들어가는 것을 포함해서 m을 배열로 변경, musucinfos[2]도 마찬가지
// - m의 배열이 중복된 순서를 가지고 있는지 체크
// - 중복 값일 경우, 가장 긴 시간을 기준으로 처리
// -

func solution(_ m:String, _ musicinfos:[String]) -> String {
    let _routine = routine(m) ?? m
    
    let arr: [String]? = musicinfos.map { $0.components(separatedBy: ",") }
        .filter {
            $0[3].count >= _routine.count
        }
        .filter {
            _routine.last == "#"
                ? ($0[3] + $0[3]).contains(_routine)
                : ($0[3] + $0[3])
                    .replacingOccurrences(of: _routine + "#", with: "")
                    .contains(_routine)
        }.max(by: {
            let lhs = number($0[1]) - number($0[0])
            let rhs = number($1[1]) - number($1[0])
            return lhs < rhs
        })
    
    return arr?[2] ?? "(None)"
}

func number(_ str: String) -> Int {
    str.components(separatedBy: ":").reduce(0) { $0 * 60 + Int($1)! }
}

func routine(_ str: String) -> String? {
    let idx = str.count / 2
    
    guard idx > 0 else { return nil }
    
    var result: String? = nil
    
    for i in (1...idx) {
        let prefix = String(str.prefix(i))
        let left = String(str.dropFirst(i))
        
        if isDuplicated(prefix: prefix, left: left) {
            result = prefix
            break
        }
    }
    
    return result
}

func isDuplicated(prefix: String, left: String) -> Bool {
    if left == prefix {
        return true
    }
    
    guard left.count >= prefix.count else {
        return false
    }
    
    guard prefix == left.prefix(prefix.count) else {
        return false
    }
    
    let left = String(left.dropFirst(prefix.count))
    return isDuplicated(prefix: prefix, left: left)
}

func array(_ str: String) -> [String] {
    str.map { String($0) }.reduce([String]()) {
        if $1 == "#" {
            let new = $0.last! + $1
            return $0.dropLast() + [new]
        }
        
        return $0 + [$1]
    }
}

print(solution("ABCDEFG", ["12:00,12:14,HELLO,CDEFGAB", "13:00,13:05,WORLD,ABCDEF"])) // "HELLO"
print(solution("CC#BCC#BCC#BCC#B", ["03:00,03:30,FOO,CC#B", "04:00,04:08,BAR,CC#BCC#BCC#B"])) // "FOO"
print(solution("ABC", ["12:00,12:14,HELLO,C#DEFGAB", "13:00,13:05,WORLD,ABCDEF"])) // "WORLD"
print(solution("CCB", ["03:00,03:10,FOO,CCB#CCB", "04:00,04:08,BAR,ABC"])) // "FOO"
print(solution("ABCDEF", ["12:00,12:15,HELLO,CDEFGAB", "12:00,12:15,WORLD,CDEFGAB"])) // "HELLO"
print(solution("CDEFGAC", ["12:00,12:06,HELLO,CDEFGA"])) // none
