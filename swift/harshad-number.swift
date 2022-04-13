// https://programmers.co.kr/learn/courses/30/lessons/12947

func solution(_ x:Int) -> Bool {
    var _x = x    
    var divider = 0
    
    while _x > 10 {
        divider += _x % 10
        _x = _x / 10
    }
    
    divider += _x
    
    return x % divider == 0
}
