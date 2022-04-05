// https://programmers.co.kr/learn/courses/30/lessons/42628

import UIKit

func solution(_ operations:[String]) -> [Int] {
    var result = [Int]()
    
    operations.forEach {
        let operation = Operation($0.components(separatedBy: " "))
        
        if operation.type == "I" {
            result.append(operation.value)
            result.sort(by: >)
        }
        
        if operation.type == "D" {
            if operation.value == 1, !result.isEmpty {
                result.removeFirst()
            }
            
            if operation.value == -1, !result.isEmpty {
                result.removeLast()
            }
        }
    }
    
    return [result.max() ?? 0, result.min() ?? 0]
}

struct Operation {
    let type: String
    let value: Int
    
    init(_ arr: [String]) {
        type = arr.first!
        value = Int(arr.last!)!
    }
}
