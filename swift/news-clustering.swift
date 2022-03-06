
// https://programmers.co.kr/learn/courses/30/lessons/17677


import UIKit

func solution(_ str1:String, _ str2:String) -> Int {
    let (lhs, rhs) = (preprocess(str1.lowercased()), preprocess(str2.lowercased()))
    
    if lhs.isEmpty, rhs.isEmpty {
        return 65536
    }
    
    let intersection = intersect(lhs, rhs)
    let unionCount = lhs.count + rhs.count - intersection.count
    let ratio = Double(intersection.count) / Double(unionCount)
    
    return Int(ratio * 65536)
}

func preprocess(_ str: String) -> [String] {
    zip(Array(str), Array(str).dropFirst())
        .map { String($0.0) + String($0.1) }
        .filter { e in
            !Array(e).contains(where: {
                String($0).rangeOfCharacter(from: .lowercaseLetters) == nil
            })
        }
}

func intersect(_ lhs: [String], _ rhs: [String]) -> [String] {
    var rhs = rhs
    var result = [String]()
    
    lhs.forEach {
        if let matchedIndex = rhs.firstIndex(of: $0) {
            result.append(rhs.remove(at: matchedIndex))
        }
    }
    
    return result
}

print(solution("FRANCE", "french")) // 16384
print(solution("handshake", "shake hands")) // 65536
print(solution("aa1+aa2", "AAAA12")) // 43690
print(solution("E=M*C^2", "e=m*c^2")) // 65536
print(solution("A+C", "ABC")) // 0
