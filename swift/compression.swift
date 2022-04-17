import UIKit

// https://programmers.co.kr/learn/courses/30/lessons/17684

/**
 
 */

func solution(_ msg:String) -> [Int] {
    let start = UnicodeScalar("A").value
    let end = UnicodeScalar("Z").value
    var nextIndex = 0
    
    let arr = (start...end).compactMap { Unicode.Scalar($0)?.description }
        .map { char -> (String, Int) in
            nextIndex += 1
            return (char, nextIndex)
        }
    
    var dic = Dictionary(uniqueKeysWithValues: arr)
    
    var result = [Int]()
    var msg = msg
    
    while !msg.isEmpty {
        for count in (1...msg.count).reversed() {
            let prefix = msg.prefix(count)
    
            if let value = dic["\(prefix)"] {
                result.append(value)
                
                if msg.count - count == 0 {
                    msg = ""
                    break
                }
                
                msg = String(msg.suffix(msg.count - count))
                nextIndex += 1
                dic[prefix + "\(msg.first!)"] = nextIndex
                break
            }
        }
    }
    
    return result
}

print(solution("KAKAO")) // [11, 1, 27, 15]
print(solution("TOBEORNOTTOBEORTOBEORNOT")) // [20, 15, 2, 5, 15, 18, 14, 15, 20, 27, 29, 31, 36, 30, 32, 34]
print(solution("ABABABABABABABAB")) // [1, 2, 27, 29, 28, 31, 30]
