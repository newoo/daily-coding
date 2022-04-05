//: [Previous](@previous)

import Foundation
import XCTest

/**
 1. 이해
 주어지는자료 : 배열, 1이상 7이하 길이, 0~9로만 이루어져 있고, 중복될 수 있음
 
 2. 계획
 문자열을 Int형 배열로 변경
 Int형 배열의 element를 조합한 수의 배열로 변형 필요
 그 다음은 소수인지 체크
 소수가 되는 규칙을 찾을 필요가 있음
 
 
 3. 실행
 4. 반성
 */

func makeArray(_ data: String) -> [Int] {
    
    var strArray: [String] = []
    var intArray: [Int] = []
    
    data.forEach {
        strArray.append(String($0))
    }
    
    makeSubArray(strArray).forEach {
        if let number = Int($0) {
            intArray.append(number)
        }
    }
    
    var intSet: Set<Int> = []
    intArray.forEach {
        intSet.insert($0)
    }
    
    intArray.removeAll()
    intArray = Array(intSet)
    
    return intArray
}

func makeSubArray(_ array: [String]) -> [String] {
    
    if array.count == 1 { return array }
    
    var subArray: [String] = []
    
    array.enumerated().forEach {
        var _array = array
        _array.remove(at: $0.offset)
        
        var _subArray = makeSubArray(_array)
        let element = $0.element
        
        _subArray.forEach {
            _subArray.append($0 + element)
        }
        
        subArray = subArray + _subArray
    }
    
    return subArray
}

func isPrimeNumber(_ number: Int) -> Bool {

    let max = Int(sqrt(Double(number)))

    for i in 5...max {
        if number % i == 0 { return false }
    }

    return true
}

//func isPrimeNumber(_ number: Int, _ root: Int) -> Bool {
//    print(number, root)
//    if root < 5 { return true }
//
//    let _root = Int(sqrt(Double(root)))
//
//    if number % _root == 0 { return false }
//
//    return isPrimeNumber(number, _root)
//}

func solution(_ numbers:String) -> Int {
    
    var strArray: [String] = []
    var intArray: [Int] = []
    var intSet: Set<Int> = []
    
    numbers.forEach {
        strArray.append(String($0))
    }
    
    makeSubArray(strArray).forEach {
        if let number = Int($0) {
            intSet.insert(number)
        }
    }
    
    intArray = Array(intSet).filter{ $0 > 1 }
    
    return intArray.filter{ isPrimeNumber($0) }.count
}

class getTests: XCTestCase {
    
//    func testArray() {
//        XCTAssertEqual([1], makeArray("110"))
//    }
    
    func testSolution() {
        XCTAssertEqual(3, solution("17"))
    }
    
    func testSolution2() {
        XCTAssertEqual(2, solution("011"))
    }
    
    func testSolution3() {
        XCTAssertEqual(1, solution("77"))
    }
}

getTests.defaultTestSuite.run()
//: [Next](@next)
