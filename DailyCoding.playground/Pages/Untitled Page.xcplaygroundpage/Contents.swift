//: [Previous](@previous)

import Foundation
import XCTest


/**
 1. 이해
 조작방법
 만들이름의 길이
 구해야하는 것은 최소 조작횟수
 
 위아래로 조작하는 횟수가 원하는 문자가 나올 때까지의 최소횟수를 구해야함
 
 2. 계획
 원하는 이름의 첫번째 글자를 가져온다.
 가져온 글자가 A와 같은지 비교한다.
 
 위아래로 조작하여 글자 변경 횟수가 작은 쪽으로 조이스틱을 움직인다.
 조이스틱을 움직인 횟수를 카운트한다.
 
 좌우에 A가 있으면 A가 있는 방향이 아닌 반대방향으로 움직인다.
 둘다 A이면 우측으로 움직인다
 둘다 A가 아니면 우측으로 움직인다.
 
 */

func upDown(_ char: Character) -> Int {
    
    let str = String(char).unicodeScalars
    
    guard let ascii = str.first?.value else {
        return 0
    }
    
    let asciiNumber = Int(ascii)
    
    if asciiNumber == 90 { return 1 }
    
    if (asciiNumber - 65) < (90 - asciiNumber) {
//        print(char, asciiNumber - 65)
        return asciiNumber - 65
    } else {
//        print(char, 90 - asciiNumber + 1)
        return 90 - asciiNumber + 1
    }
    
    
}

func movePosition(_ nameArray: [Character]) -> Int {
    
    if nameArray.count == 1 {
        
        if String(nameArray[0]) == "A" {
            return -1
        } else {
            return upDown(nameArray[0])
        }
        
        
    }
    
    let count = upDown(nameArray[0])
    
    var _nameArray = nameArray
    _nameArray.remove(at: 0)
    
    return movePosition(_nameArray) + count + 1
}

func solution(_ name: String) -> Int {
    
    var nameArray = Array(name)
    
    if nameArray.count == 1 { return upDown(nameArray[0]) }
    
    var allA = true
    nameArray.forEach{
        if $0 != "A" { allA = false }
    }
    if allA == true { return 0 }
    
    var totalCount = 0
    
    totalCount += upDown(nameArray[0])
    nameArray.remove(at: 0)
    
    
    if(nameArray[nameArray.count-1] != "A") {
        totalCount += movePosition(nameArray.reversed())
    } else {
        totalCount += movePosition(nameArray)
    }
    
    return totalCount + 1
}

class GetAnswerTests: XCTestCase {
//    func testUpDown() {
//        XCTAssertEqual(9, upDown("R"))
//    }
    
    func testSolution() {
        XCTAssertEqual(56, solution("JEROEN"))
    }
    func testSolution2() {
        XCTAssertEqual(23, solution("JAN"))
    }
    func testSolution3() {
        XCTAssertEqual(3, solution("BBAA"))
    }
}


GetAnswerTests.defaultTestSuite.run()





//: [Next](@next)
 
