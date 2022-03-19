// https://programmers.co.kr/learn/courses/30/lessons/42895

/**
 사칙연산 - 4가지의 경우의 수로 분기처리
 여기에 같은 숫자가 연속적으로 있는 수가 있을 수 있다는 것도 포함
 총 5가지 연산방식이 존재할 수 있음
 */

import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
  if N == number {
    return 1
  }
  
  let result = search(current: N, n: N, number: number, count: 1)
  return result == 10 ? -1 : result
}

func search(current: Int, n: Int, number: Int, count: Int) -> Int {
  guard count < 9 else {
    return 10
  }
  
  if current == number {
    return count
  }
  
  let arr1 = [
    current * 10 + n,
    current * n,
    current / n,
    current + n,
    current - n
  ].map { search(current: $0, n: n, number: number, count: count + 1) }
  
  let arr2 = [
    current + 1,
    current - 1,
    current + (n * n),
    current - (n * n),
    current + (n * 10 + n),
    current - (n * 10 + n),
  ].map { search(current: $0, n: n, number: number, count: count + 2) }
  
  guard 8 - count >= 3 else {
    return (arr1 + arr2).min() ?? 10
  }

  let arrN = (3...(8 - count)).reduce([Int]()) { arr, a in
    let adding = (1...a).reduce(1) { o, _ in o * n }
    let _adding = (1...a).reduce(0) { o, _ in o * 10 + n }
    return arr + [
      current + adding,
      current - adding,
      current + _adding,
      current - _adding,
      current * _adding,
      current / _adding
    ].map { c in
      search(current: c, n: n, number: number, count: count + a)
    }
  }

  return (arr1 + arr2 + arrN).min() ?? 10
}

print(solution(5, 12)) // 4
print(solution(2, 11)) // 3
print(solution(5, 31168)) // -1
print(solution(8, 53)) // 5 <- 위의 로직으로는 6이 나옴

