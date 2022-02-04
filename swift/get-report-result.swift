import Foundation

/**
 
 https://programmers.co.kr/learn/courses/30/lessons/92334
 
 */

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
  let report = Array(Set(report))
  
  var reporting = id_list.reduce(into: [String: Set<String>](), {
    $0.merge([$1: Set<String>()]) { $1 }
  })
  
  var reported = id_list.reduce(into: [String: Int](), {
    $0.merge([$1: 0]) { $1 }
  })
  
  report.forEach {
    let arr = $0.components(separatedBy: " ")
    reporting[arr[0]]?.insert(arr[1])
    reported[arr[1]] = (reported[arr[1]] ?? 0) + 1
  }
  
  let blocked = reported.filter { $0.value >= k }.map { $0.key }
  
  let result: [String: Int] = reporting.mapValues { v in
    blocked.filter { v.contains($0) }.count
  }
  
  return id_list.compactMap { result[$0] }
}

print(solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2)) // [2,1,1,0]
print(solution(["con", "ryan"], ["ryan con", "ryan con", "ryan con", "ryan con"], 3)) // [0,0]

