import UIKit

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    let users = user_id.map { Array($0) }
    var duplicates = Dictionary(uniqueKeysWithValues: Set(banned_id).map{ ($0, 0) })
    var cases = Dictionary(uniqueKeysWithValues: Set(banned_id).map{ ($0, [String]()) })
    
    banned_id.forEach { banned in
        duplicates[banned] = (duplicates[banned] ?? 0) + 1
    }
    
    Set(banned_id).forEach { banned in
        user_id.forEach { user in
            if isPossible(Array(user), Array(banned)) {
                cases[banned] = (cases[banned] ?? 0) + 1
            }
        }
    }
    
    return Dictionary<String, Int>(uniqueKeysWithValues: cases.map { k, v in
        guard let duplicate = duplicates[k], duplicate > 1 else {
            return (k, v)
        }
        
        let value = fac(v) / (fac(duplicate) * fac(v - duplicate))
        
        return (k, value)
    }).reduce(1) {
        $1.value == 0 ? $0 : $0 * $1.value
    }
}

func isPossible(_ lhs: [String.Element], _ rhs: [String.Element]) -> Bool {
    guard lhs.count == rhs.count else {
        return false
    }
    
    return !zip(lhs, rhs).contains(where: {
        if $0.1 == "*" {
            return false
        }
        
        if $0.0 != $0.1 {
            return true
        }
        
        return false
    })
}

func fac(_ n: Int) -> Int {
    n < 1 ? 1 : (1...n).reduce(1, *)
}

print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "abc1**"])) // 2
print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["*rodo", "*rodo", "******"])) // 2
print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "*rodo", "******", "******"])) // 3
