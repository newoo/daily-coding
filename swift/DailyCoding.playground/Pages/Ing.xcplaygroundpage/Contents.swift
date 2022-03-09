//: [Previous](@previous)

// https://programmers.co.kr/learn/courses/30/lessons/72411

/**
 - 코스 종류 만들기
 */

import Foundation

let cache = [Int: [String]]()

func solution(_ orders:[String], _ course:[Int]) -> [String] {
  let arr = orders.map { Array($0) }.flatMap { $0 }.map { String($0) }
  let filtered = Array(Set(arr)).sorted()
  
  let list = course.map {
    makeCourse(menus: filtered, count: $0).map { ($0, 0) }
  }.flatMap { $0 }
  
  let dic = Dictionary(uniqueKeysWithValues: list)
}

func makeCourse(menus: [String], count: Int) -> [String] {
  if let value = cache[count] {
    return value
  }
  
  var _menus = menus
  
  return count == 1 ? menus : menus.map { menu -> [String] in
    _menus.removeAll(where: { $0 == menu })
    return makeCourse(menus: _menus, count: count - 1).map { menu + $0 }
  }.flatMap { $0 }
}

func dropMenu(_ menu: String, in menus: [String]) -> [String] {
  var menus = menus
  menus.removeAll(where: { $0 == menu })
  return menus
}

print(solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4])) // ["AC", "ACDE", "BCFG", "CDE"]
//print(solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2,3,5])) // ["ACD", "AD", "ADE", "CD", "XYZ"]
//print(solution(["XYZ", "XWY", "WXA"], [2,3,4])) // ["WX", "XY"]

//: [Next](@next)
