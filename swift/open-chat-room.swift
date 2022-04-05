import Foundation

/**
 
 https://programmers.co.kr/learn/courses/30/lessons/42888
 
 */

func solution(_ record:[String]) -> [String] {
  var nicknameDic: [String: String] = [:]
  
  return record.map { $0.components(separatedBy: " ") }
    .map { record -> Msg in
      if record.count > 2 {
        nicknameDic[record[1]] = record[2]
      }
      
      return Msg(uid: record[1], msg: record[0])
    }.compactMap { msg -> String? in
      guard let name = nicknameDic[msg.uid], let text = msg.krText else { return nil }
      return "\(name)님이 \(text)"
    }
}

struct Msg {
  let uid: String
  let msg: String
  
  var krText: String? {
    switch msg.lowercased() {
    case "enter":
      return "들어왔습니다."
      
    case "leave":
      return "나갔습니다."
      
    default:
      return nil
    }
  }
}

print(solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"])) // ["Prodo님이 들어왔습니다.", "Ryan님이 들어왔습니다.", "Prodo님이 나갔습니다.", "Prodo님이 들어왔습니다."]

