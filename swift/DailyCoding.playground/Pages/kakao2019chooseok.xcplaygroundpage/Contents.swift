//: [Previous](@previous)

/**

### 1. 이해

- 모르는 것은 무엇인가?
- 주어진 것은 무엇인가?
- 자료는 무엇인가?
- 조건은 무엇인가?
- 조건은 알아내야 하는 것을 찾는데 충분한가?

자료는 로그날짜 및 시간 그리고 처리시간
조건은 초당 처리량 계산
기준 1초의 시작시점이 유동적이다
 구간별 처리갯수가 동일한 구간이 나올 수 있다.
 처리시간 최대 3초(3000밀리초)

### 2. 계획

계획을 세우기 전에 아래와 같은 질문을 던지면 굉장히 유용합니다.

- 관련된 문제를 알고 있는가?
- 모르는 부분이 유사한 다른 문제를 풀어 본 적이 있는가?
- 전에 풀어 본 문제를 활용하려면 어떤 보조 요소를 도입해야 되는가?
- 도움이 될 것 같은 어떤 사실이나 정리를 알고 있는가? (보통은 자료 구조나 수학적 공리 또는 정의가 해당될 겁니다.)

계획을 세운 뒤 아래 질문을 통해 한번 더 점검합니다.

- 자료와 조건은 모두 활용 했는가? (Edge case가 될 조건을 꼭 확인합니다. 보통은 이걸 놓쳐서 지옥에 빠지죠.)

구간을 어떻게 만들어 낼 것인가가 중요해보임
 주어진 자료를 가지고 시작시점과 종료시점을 정확하게 해두는 편이 좋을 듯
 시간을 원래대로 들고 있지 말고 Int값으로 죄다 변경
 사실 날짜는 스킵해도 무방 중요한 것은 시분초와 처리시간
 다른 형태의 문제로 변형해서 푸는 것이 중요해보임

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

 쇠막대기랑 비슷하다는 것을 도중에 깨달음
 숨겨져 있는 조건으로 기준 구간이 일정하지 않으니 endTime에 0.999초를 더해주어야 했음
 초반에 문제를 제대로 이해했다가 도중에 잘못된 이해가 되었다가 테스트가 실패해서 이해된 것이 머릿속에서 자체 수정되었다는 것을 알 수 있었음

*/

import Foundation
import XCTest

struct Line {
    var isStart: Bool
    var value: Int
    
    init(_ isStart: Bool, _ value: Int) {
        self.isStart = isStart
        self.value = value
    }
    
}

func makeLine(_ lines: [String]) -> [Line] {
    
    var results = [Line]()
    
    var index = 0
    for line in lines {
        let array = line.split(separator: " ")
        let time = array[1].split(separator: ".").map{ String($0) }
        let endNumber = convert(time.first!) + Int(time.last!)!
        
        results.append(Line(false, endNumber + 999))
        
        let startNumber = endNumber - array[2].split(separator: "s").map{ Int(Double(String($0))! * 1000.0) }.last!
        results.append(Line(true, startNumber))
        
        print(startNumber, endNumber)
        index += 1
    }
    
    return results
    
}

func convert(_ time: String) -> Int {
    
    var result = 0
    let array = time.split(separator: ":").map{ String($0) }
    result = Int(array[2]) ?? 0
    result += (Int(array[1]) ?? 0) * 60
    result += (Int(array[0]) ?? 0) * 60 * 60
    
    return result * 1000
}

func solution(_ lines:[String]) -> Int {
    
    let array = makeLine(lines).sorted{ $0.value < $1.value }
    var max = 0
    var current = 0
    
    for line in array {
        if line.isStart {
            current += 1
            max = current > max ? current : max
        } else {
            current -= 1
        }
        print(line.isStart, line.value, current)
    }
    
    return max
}

print(solution(["2016-09-15 20:59:57.421 0.351s",
                "2016-09-15 20:59:58.233 1.181s",
                "2016-09-15 20:59:58.299 0.8s",
                "2016-09-15 20:59:58.688 1.041s",
                "2016-09-15 20:59:59.591 1.412s",
                "2016-09-15 21:00:00.464 1.466s",
                "2016-09-15 21:00:00.741 1.581s",
                "2016-09-15 21:00:00.748 2.31s",
                "2016-09-15 21:00:00.966 0.381s",
                "2016-09-15 21:00:02.066 2.62s"
]))



//: [Next](@next)
