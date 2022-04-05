// https://programmers.co.kr/learn/courses/30/lessons/49993

/**
 */

import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
  let skillArr = Array(skill)
  let skillTreesArr = skill_trees.map { Array($0) }
  var indice = Array(repeating: -1, count: skillTreesArr.count)
  
  skillArr.forEach { skill in
    skillTreesArr.enumerated().forEach {
      if let i = $0.element.firstIndex(of: skill) {
        indice[$0.offset] = i > indice[$0.offset] && indice[$0.offset] < 30 ? i : 30
      } else if indice[$0.offset] < 30 {
        indice[$0.offset] = 29
      }
    }
  }
  
  return indice.filter { $0 < 30 }.count
}

print(solution("CBD", ["BACDE", "CBADF", "AECB", "BDA"])) // 2

//func solution(_ skill:String, _ skill_trees:[String]) -> Int {
//
//    func available(_ s: String, _ t: String) -> Bool {
//        let alza = t.filter { s.contains($0) }
//        return s.starts(with: alza)
//    }
//
//    return skill_trees.map { available(skill, $0) }.filter { $0 }.count
//}

