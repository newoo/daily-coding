import Foundation

func removeInValidCharacter(newId: String) -> String {
    let pattern = "^[a-z0-9-_.]$"
    
    let regex = try? NSRegularExpression(pattern: pattern)
    
    return newId.filter {
        let element = String($0)
        let range = NSRange(element.startIndex...,  in: element)
        let result = regex?.matches(in: element, options: [], range: range)
        
        return result?.isEmpty == false
    }
}

func replaceDots(newId: String) -> String {
    return newId.reduce("") {
        if $0.last == ".", $1 == "." {
            return $0
        }
        
        return $0 + String($1)
    }
}

func removeEdgeDots(in newId: String) -> String {
    var newId = newId
    
    if newId.first == "." {
        newId.removeFirst()
    }
    
    if newId.last == "." {
        newId.removeLast()
    }
    
    return newId
}

func checkEmpty(newId: String) -> String {
    newId.isEmpty ? "a" : newId
}

func shrink(newId: String) -> String {
    guard newId.count >= 15 else {
        return newId
    }
    
    let endIndex = newId.index(newId.startIndex, offsetBy: 14)
    return String(newId[newId.startIndex...endIndex])
}

func makeLonger(newId: String) -> String {
    var newId = newId
    
    guard let last = newId.last else {
        return ""
    }
    
    while(newId.count <= 2) {
        newId = newId + String(last)
    }
    
    return newId
}

func solution(_ new_id:String) -> String {
    let wrappedNewId = [new_id]
        .map { $0.lowercased() }
        .map(removeInValidCharacter(newId:))
        .map(replaceDots(newId:))
        .map(removeEdgeDots(in:))
        .map(checkEmpty(newId:))
        .map(shrink(newId:))
        .map(removeEdgeDots(in:))
        .map(makeLonger(newId:))
    
    return wrappedNewId.first ?? ""
}
