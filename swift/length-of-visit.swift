// https://programmers.co.kr/learn/courses/30/lessons/49994

/**
 
 */

func solution(_ dirs:String) -> Int {
    var cache = Set<[Int]>()
    var position = (0, 0)
    
    dirs.map { String($0) }.forEach {
        var _position = movePosition(position, direction: $0)
        _position = relocatePosition(_position)
        
        if position == _position {
            return
        }
        
        if !cache.contains([_position.0, _position.1, position.0, position.1]) {
            cache.insert([position.0, position.1, _position.0, _position.1])
        }
        
        position = _position
    }
    
    return cache.count
}

func movePosition(_ position: (Int, Int), direction: String) -> (Int, Int) {
    let (x, y) = position
    
    switch direction {
    case "U":
        return (x, y + 1)
        
    case "D":
        return (x, y - 1)
        
    case "R":
        return (x + 1, y)
        
    case "L":
        return (x - 1, y)
        
    default:
        return position
    }
}

func relocatePosition(_ position: (Int, Int)) -> (Int, Int) {
    var (x, y) = position
    
    if x > 5 {
        x = 5
    }
    
    if x < -5 {
        x = -5
    }
    
    if y > 5 {
        y = 5
    }
    
    if y < -5 {
        y = -5
    }
    
    return (x, y)
}

print(solution("ULURRDLLU")) // 7
print(solution("LULLLLLLU")) // 7
