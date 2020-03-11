/**

https://programmers.co.kr/learn/courses/30/lessons/42583?language=swift

1. 이해
다리의 길이, 다리가 견디는 무게가 주어짐
트럭 무게 배열
트럭이 다리를 모두 건널 때까지 걸리는 시간
모든 트럭은 1초에 1씩 이동
다리가 견디는 무게에 따라 한 번에 다리를 지날 수 있는 트럭 갯수가 다름

2. 계획
3개의 큐를 만든다
 다리를 지난 트럭 큐
 다리 위의 트럭 큐
 기다리고 있는 트럭 큐
 
 무한 반복문을 사용...?
 

3. 실행

4. 반성

*/

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    
    var reversedTrucks: [Int] = truck_weights.reversed()
    var onTrucks: [(weight: Int, time: Int)] = []
    
    var count = 0
    var currentWeight = 0
    
    repeat {
        count += 1
        
        onTrucks = onTrucks.map{ ($0.weight, $0.time + 1) }.filter{
            if $0.time <= bridge_length {
                return true
            } else {
                currentWeight -= $0.weight
                return false
            }
        }
        
//        if currentWeight + (reversedTrucks.last ?? weight) <= weight, !reversedTrucks.isEmpty {
//            let truck = reversedTrucks.removeLast()
//            onTrucks.append((truck, 1))
//            currentWeight += truck
//        }
        
        if currentWeight + (reversedTrucks.last ?? weight + 1) <= weight {
            let truck = reversedTrucks.removeLast()
            onTrucks.append((truck, 1))
            currentWeight += truck
        }
        
    } while(!onTrucks.isEmpty)
    
    return count
}

solution(2, 10, [7,4,5,6])
solution(100, 100, [10])
solution(100, 100, [10,10,10,10,10,10,10,10,10,10])

