import Foundation
import XCTest

/**
 
 https://programmers.co.kr/learn/courses/30/lessons/42840
 
 1. 이해
 누가 가장 많이 정답을 맞추나? 배열로 리턴
 동점일 경우 오름차순으로 정렬된 배열을 리턴
 
 1번 ~3번 수포자가 정답을 찍는 방식
 1번 - 1, 2, 3, 4, 5 를 순서대로 반복 5
 2번 - 2, 1, 2, 3, 2, 4, 2, 5 를 순서대로 반복 8
 3번 - 3, 3, 1, 1, 2, 2, 4, 4, 5, 5를 순서대로 반복 10
 
 시험은 최대 10,000문제
 문제의 정답은 1 ~5 중 하나
 
 
 2. 계획
 정답을 찍는 방식의 규칙성 파악
 정답 배열을 풀 스캔하는 것은 당연한 상황
 최소 공배수를 구해야함 = 40
 3명의 수포자의 정답규칙이 나열된 튜플형식의 배열 만들고
 정답 배열과 비교
 
 3. 실행
 
 4. 반성
 
 */
func makeRules() -> [(Int, Int, Int)] {
    
    let firstRule = [1, 2, 3, 4, 5]
    let secondRule = [2, 1, 2, 3, 2, 4, 2, 5]
    let thirdRule = [3, 3, 1, 1, 2, 2, 4, 4 ,5, 5]
    
    var answer: [(Int, Int, Int)] = []
    
    for i in 0..<40 {
        answer.append((firstRule[i%5], secondRule[i%8], thirdRule[i%10]))
    }
    
    return answer
}

func solution(_ answers:[Int]) -> [Int] {
    var count = [0, 0, 0]
    let rules = makeRules()
    
    for (offset, element) in answers.enumerated() {
        if rules[offset].0 == element { count[0] += 1 }
        if rules[offset].1 == element { count[1] += 1 }
        if rules[offset].2 == element { count[2] += 1 }
    }
    
    let max = count.max()
    
    return count.enumerated().map {
        if $0.element == max {
            return $0.offset + 1
        } else {
            return 0
        }
    }.filter { $0 != 0 }
}

class getTests: XCTestCase {
    func testMakeRules() {
        XCTAssertEqual(5, makeRules()[39].2)
    }
    
    func testSolution() {
        XCTAssertEqual([2,3], solution([4,4,4,5,2]))
    }
}

getTests.defaultTestSuite.run()
