//: [Previous](@previous)

// 문제 : https://programmers.co.kr/learn/courses/30/lessons/12934
// 정수 제곱근 판별

/**
 
 1. 이해
 주어진 자료  - n: Int
 최종 리턴 값이 n의 제곱근에 +1를 한 뒤 다시 제곱하는 것
 n의 제곱근이 정수가 아니면 -1이 최종 리턴값
 
 2. 계획
 제곱근을 구하는 방법
 제곱을 하는 방법
 정수 판별
 
 3. 실행
 
 4. 반성
 계획을 잡고 진행했어야 했는데 처음 풀이했을 때는 이를 스킵하고 진행해버렸음
 
 */

import Foundation
import XCTest

func findRoot(_ n: Int) -> Int {
    
    if n < 2 { return 4 }
    
    for i in 1..<n/2 {
        if n == getSquare(i) { return getSquare(i + 1) }
    }
    
    return -1
}

func getSquare(_ n: Int) -> Int {
    return n * n
}

class GetSquareTests: XCTestCase {
    
    func testSample() {
        XCTAssertEqual(144, 144)
    }
    
    func testFindRoot() {
        XCTAssertEqual(144, findRoot(121))
    }
}

GetSquareTests.defaultTestSuite.run()

//: [Next](@next)
