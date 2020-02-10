//: [Previous](@previous)

/**
 
 https://programmers.co.kr/learn/courses/30/lessons/12901
 
 1. 이해
 
 16년 1월 1일 -> 금요일

 16년 a월 b일은 무슨 요일
 a: 1~12, b: 1~31
 2016년은 윤년
 
 2. 계획
 
 월별 1일이 무슨 요일인지?
 요일을 링크드 리스트로 묶어서 관리
 
 3. 실행
 
 4. 반성
 계획과는 다르게 진행되었음
 2개의 계획 중에 1개만 진행되었음
 TDD방식대로 진행했는지 의문...

 
 */

import Foundation
import XCTest


func getDayOfWeek(_ a: Int, _ b: Int) -> String {
    
    if a == 1, b == 1 { return "FRI" }
    
    let root = getFirstDayOfWeek(a)
    let dayOfWeekArray = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    
    var index = 0
    for (offset, element) in dayOfWeekArray.enumerated() {
        if element == root { index = offset }
    }
    
    index += (b - 1)
    index %= 7
    
    return dayOfWeekArray[index]
}

func getFirstDayOfWeek(_ a: Int) -> String {
    
    if a == 1 { return "FRI" }
    
    let monthDaysCount = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let dayOfWeekArray = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    
    var index = 5
    (1..<a).forEach { index += monthDaysCount[$0 - 1] }
    
    index %= 7
    
    return dayOfWeekArray[index]
}

func solution(_ a:Int, _ b:Int) -> String {
    return getDayOfWeek(5, 24)
}

class Get2016Tests: XCTestCase {
    func testGetDayOfWeek() {
        XCTAssertEqual("SUN", getDayOfWeek(1, 10))
    }
    
    func testGetFirstDayOfWeek() {
        XCTAssertEqual("TUE", getFirstDayOfWeek(3))
    }
}

Get2016Tests.defaultTestSuite.run()

//: [Next](@next)
