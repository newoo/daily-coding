//: [Previous](@previous)

import Foundation
import XCTest

func meetRound(_ participantsCount: Int, _ a: Int, _ b:Int) -> Int {
    var participants = [String]()

    for index in 0 ..< participantsCount {
        if index + 1 == a || index + 1 == b {
            participants.append("A")
        } else {
            participants.append("Z")
        }
    }

    return findRound(participants, 1)
}

func findRound(_ participants: [String], _ round: Int) -> Int {
    var nextParticipants = [String]()

    for i in stride(from: 0, to: participants.count, by: 2) {
        if isMatch(participants[i], participants[i+1]) {
            return round
        }

        if participants[i] == "A" {
            nextParticipants.append(participants[i])
        } else if participants[i + 1] == "A" {
            nextParticipants.append(participants[i+1])
        } else {
            nextParticipants.append(participants[i])
        }
        if i > participants.count {
            break
        }
    }

    return findRound(nextParticipants, round + 1)
}

func isMatch(_ a: String, _ b: String) -> Bool {
    return a == "A" && b == "A"
}

class GetDrawTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(meetRound(8, 4, 7), 3)
    }

    func testIsMatch() {
        XCTAssertEqual(isMatch("A", "A"), true)
    }

    func testIsMatchWhenReversed() {
        XCTAssertEqual(isMatch("Z", "A"), true)
    }
}

GetDrawTests.defaultTestSuite.run()



// - MARK: 2번째 풀이
/**
 1. 이해
 대회에 N명이 참가함, 1번부터 N번까지 부여받음
 1-2, 3-4, ... (N-1)-N번의 참가자끼리 게임진행, 토너먼트 형식
 승자가 1번부터 다시 번호 재부여
 A번 참가자가 B번 참가자를 몇 번째 라운드에서 만나는지
 A번과 B번 참가자는 반드시 이긴다고 가정
 A와 B는 N이하
 N은 2이상 2의 20승이하 자연수 - 부전승 발생하지 않는다.
 
 2. 계획
 승자를 선정해서 재귀형태로 진행하는 것이 아니라
 패자를 제거하는 형태로 한다면 어떻게 될까?
 배열같은 선형 구조에 1번부터 N번까지 넣고
 패자를 배열에서 삭제시켜가면서 한다면?
 
 배열에 숫자를 넣고
 숫자 2개씩 꺼내어서
 AB인지 확인하고
 맞으면 라운드를 출력
 
 
 3. 실행

 
 4. 반성
테스트 하면서 진행했어야 되는데 중후반부에는 그렇지 못했음
 실제 계획이랑 다르게 진행됨
 
 
 */


//class Draw {
//
//    let a: Int
//    let b: Int
//    var paticipants = [Int]()
//
//    init(_ n: Int, _ a: Int, _ b: Int) {
//        self.a = a
//        self.b = b
//
//        for i in 1...n {
//            self.paticipants.append(i)
//        }
//    }
//
//    func matchAB(_ n1: Int, _ n2: Int) -> Bool {
//        return (self.a == n1 && self.b == n2) || (self.a == n2 && self.b == n1)
//    }
//
//    func doFight() -> Int {
//
//        if self.paticipants.count == 0 { return 0 }
//
//        for i in stride(from: 0, to: self.paticipants.count, by: 2) {
//
//            if matchAB(paticipants[i], paticipants[i + 1]) { return 1 }
//
//            if paticipants[i] == a || paticipants[i] == b {
//                paticipants[i+1] = 0
//            }
//
//            if paticipants[i+1] == a || paticipants[i+1] == b {
//                paticipants[i] = 0
//            }
//        }
//
//        self.paticipants = self.paticipants.filter{ $0 != 0 }
//
//        return doFight() + 1
//    }
//}
//
//func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
//
//    let draw = Draw(n, a, b)
//
//    return draw.doFight()
//}
//
//
//
//class GetDraw2Tests: XCTestCase {
//    func testMatchAB() {
//        let draw = Draw(1, 4, 7)
//        XCTAssertEqual(true, draw.matchAB(4, 7))
//    }
//
//    func testDoFight() {
//        let draw = Draw(8, 4, 7)
//        XCTAssertEqual(3, draw.doFight())
//    }
//}
//
//GetDraw2Tests.defaultTestSuite.run()

//: [Next](@next)
