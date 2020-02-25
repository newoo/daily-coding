/**

 ### 1. 이해

 - 모르는 것은 무엇인가?
 - 주어진 것은 무엇인가?
 - 자료는 무엇인가?
 - 조건은 무엇인가?
 - 조건은 알아내야 하는 것을 찾는데 충분한가?
 
 자료로 문자열이 주어지고, 문자열 중앙에 위치하는 문자 1개를 반환하는 것
 문자열 갯수가 짝수일 때는 2개를 반환
 문자열 크기는 1~100

 ### 2. 계획

 계획을 세우기 전에 아래와 같은 질문을 던지면 굉장히 유용합니다.

 - 관련된 문제를 알고 있는가?
 - 모르는 부분이 유사한 다른 문제를 풀어 본 적이 있는가?
 - 전에 풀어 본 문제를 활용하려면 어떤 보조 요소를 도입해야 되는가?
 - 도움이 될 것 같은 어떤 사실이나 정리를 알고 있는가? (보통은 자료 구조나 수학적 공리 또는 정의가 해당될 겁니다.)

 계획을 세운 뒤 아래 질문을 통해 한번 더 점검합니다.

 - 자료와 조건은 모두 활용 했는가? (Edge case가 될 조건을 꼭 확인합니다. 보통은 이걸 놓쳐서 지옥에 빠지죠.)
 
 홀수일 때와 짝수일 때를 구분하여 적용
 String이 시퀀스인가 생각해볼 것 -> 시퀀스라면 내부 문자들을 배열처럼 다룰 수 있을 것이라 추측

 ### 3. 실행

 코딩을 하는 단계입니다. 물론 Test case부터 먼저 작성 해야겠죠?

 - 각 단계가 올바른지 명확히 알 수 있는가?
 - 그것이 옳다는 것을 설명할 수 있는가?

 질문을 보면 아시겠지만 이게 TDD를 같이 하는 이유입니다.

 Test code를 통해 각 단계가 올바르게 동작하는 것을 증명할 수 있기 때문입니다.

 사람의 머리로는 증명할 수 없습니다. 명심하세요! 증명은 코드를 통해 합니다.

 ### 4. 반성

 반성이 제일 중요합니다. 반성한 부분을 다음날 훈련에 반영합니다.

 - 다른 방법으로 해결할 수는 없었는가? (다른 사람의 풀이도 참고하면 좋습니다.)
 - 결과나 방법을 다른 문제에 활용할 수 있는가? (유용한 패턴은 계속 써먹을 수 있죠.)
 
 String의 메서드를 활용하지 못했음
 홀수와 짝수를 나누는 것에 대해서 먼저 생각했어야 하나?
 
 */

import UIKit
import XCTest

func solution(_ s:String) -> String {
    
    let index = s.count / 2
    let array = Array(s)
    
    guard s.count % 2 == 1 else { return String(array[index-1...index]) }
    
    return String(array[index])
}

print(solution("qwer"))
print(solution("abcde"))

class GetCenterTests: XCTestCase {
    
    override func setUp() {
        print("테스트 시작")
        super.setUp()
    }
    override func tearDown() {
        print("테스트 종료")
        super.tearDown()
    }
    
    func testOdd() {
        let oddText = "zABzDEz"
        let array = Array(oddText)
        let index = array.count/2
        
        XCTAssertEqual("z", array[index])
    }
    
    func testEven() {
        let oddText = "zzzABzzDEzzz"
        let array = Array(oddText)
        let index = array.count/2
        
        XCTAssertEqual("zz", String(array[index-1...index]))
    }
    
    func testIsOdd() {
        let oddText = "zABzDEz"
        XCTAssertTrue(oddText.count % 2 == 1)
    }
    
}

GetCenterTests.defaultTestSuite.run()


