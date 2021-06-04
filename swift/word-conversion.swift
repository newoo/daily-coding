import Foundation

func isNext(begin: [Character], target:[Character]) -> Bool {
    let difference = (0..<begin.count).filter({ index in
        begin[index] != target[index]
    })
    
    return difference.count == 1
}

func convert(begins: [String], target: String, words: [String], count: Int) -> Int {
    if begins.contains(target) {
        return count
    }
    
    var result = [String]()
    
    begins.forEach({ begin in
        let filtered = words.filter({
            isNext(begin: Array(begin), target: Array($0))
        })
        
        result.append(contentsOf: filtered)
    })
    
    return convert(begins: result, target: target, words: words, count: count + 1)
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    if !words.contains(target) {
        return 0
    }
    
    return convert(begins: [begin], target: target, words: words, count: 0)
}