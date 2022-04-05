
// https://programmers.co.kr/learn/courses/30/lessons/12922

func solution(_ n:Int) -> String {
    (1...n).reduce("") {
        $0 + ($1 % 2 == 1 ? "수" : "박")
    }
}
