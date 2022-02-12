// https://programmers.co.kr/learn/courses/30/lessons/17678

/**
 - 마지막 버스 도착 시간
 - 마지막 버스 첫 탑승자의 순서(이전 버스에 대기하던 사람들이 다 못타는 경우도 고려 필요)
 - 마지막 버스 마지막 탑승자의 대기 시작 시간
 - 마지막 탑승자보다 먼저 와야함
 - 마지막 탑승자가 마지막 버스도착 시간보다 늦은지도 체크 필요
 */

import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
  var busTimeTable = (0...(n - 1)).map { 540 + $0 * t }
  let crewTimeTable = timetable.compactMap { toTime(from: $0) }.sorted()
  
  let lastButTime = busTimeTable.removeLast()
  let goneCrewCount = getPreviousGoneCount(busTimeTable: busTimeTable,
                                                 crewTimeTable: crewTimeTable,
                                                 capacity: m)
  if crewTimeTable.count < goneCrewCount + m {
    return toTimeText(from: lastButTime)
  }
  
  let lastIndexToTakeBus = goneCrewCount + m - 1
  let lastCrewTime = crewTimeTable[lastIndexToTakeBus] - 1
  return toTimeText(from: min(lastCrewTime, lastButTime))
}

func toTime(from timeText: String) -> Int {
  let arr = timeText.components(separatedBy: ":").compactMap { Int($0) }
  return arr.first! * 60 + arr.last!
}

func toTimeText(from time: Int) -> String {
  let hour = time / 60
  let hourText = hour > 9 ? "\(hour)" : "0\(hour)"
  let minute = time % 60
  let minuteText = minute > 9 ? "\(minute)" : "0\(minute)"
  return "\(hourText):\(minuteText)"
}

func getPreviousGoneCount(busTimeTable: [Int], crewTimeTable: [Int], capacity: Int) -> Int {
  var count = 0
  var crewTimeTable = crewTimeTable
  
  for busTime in busTimeTable {
    if crewTimeTable.isEmpty {
      break
    }
    
    for _ in (1...capacity) {
      if crewTimeTable.isEmpty {
        break
      }
      
      if busTime >= crewTimeTable.first! {
        count += 1
        crewTimeTable.removeFirst()
        continue
      }
      
      break
    }
  }
  
  return count
}


print(solution(1, 1, 5, ["08:00", "08:01", "08:02", "08:03"])) // "09:00"
print(solution(2, 10, 2, ["09:10", "09:09", "08:00"])) // "09:09"
print(solution(2, 1, 2, ["09:00", "09:00", "09:00", "09:00"])) // "08:59"
print(solution(1, 1, 5, ["00:01", "00:01", "00:01", "00:01", "00:01"])) // "00:00"
print(solution(1, 1, 1, ["23:59"])) // "09:00"
print(solution(10, 60, 45, ["23:59","23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59"])) // "18:00"

