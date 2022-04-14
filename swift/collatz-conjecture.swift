// https://programmers.co.kr/learn/courses/30/lessons/12943

func solution(_ num:Int) -> Int {
    var currentCount = 0
    var _num  = num
    
    while currentCount < 500 {
        if _num == 1 {
            return currentCount
        }
        
        _num = _num % 2 == 0 ? _num / 2 : _num * 3 + 1
        currentCount += 1
    }
    
    return -1
}
