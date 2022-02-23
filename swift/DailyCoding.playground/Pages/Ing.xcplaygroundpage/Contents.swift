//: [Previous](@previous)

// https://programmers.co.kr/learn/courses/30/lessons/12977

/**
 - 중복되지 않게 3개의 수를 뽑아서 배열을 만들고
 - 배열 내 숫자가 소수인지 판단
 */

import Foundation

func solution(_ nums:[Int]) -> Int {
  let arr = (0...(nums.count - 3)).reduce([Int]()) { result, i in
    result + pick(nums: Array(nums[i...(nums.count - 1)]))
  }//.filter { isPrime(num: $0) }
  print(arr)
  var answer = -1
  
  return answer
}

func pick(nums: [Int], count: Int = 1) -> [Int] {
  if count == 3 {
    return nums
  }
  
  var _nums
  
  return nums.reduce([Int]()) { result, num in
    let mNums = Array(nums.drop(while: { $0 == num }))
    return result + pick(nums: mNums, count: count + 1).map { $0 + num }
  }
}

func isPrime(num: Int) -> Bool {
  if num % 2 == 0 {
    return false
  }
  
  if (num / 3) < 3 {
    return true
  }
  
  return !(3...(num / 3)).contains(where: { num % $0 == 0 })
}

print(solution([1,2,3,4])) // 1
//print(solution([1,2,7,6,4])) // 4
//print(pick(nums: [1,2,7,6,4]))

//: [Next](@next)
