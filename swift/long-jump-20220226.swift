
// https://programmers.co.kr/learn/courses/30/lessons/12914

import UIKit

func solution(_ n:Int) -> Int {
    (0...(n / 2)).reduce(0) {
        $0 + (fac(n - $1) / (fac($1) * fac(n - $1 * 2)))
    } % 1234567
}

func fac(_ n: Int) -> Int {
    return n < 1 ? 1 : (1...n).reduce(1, *)
}

print(solution(4)) // 5
print(solution(3)) // 3
