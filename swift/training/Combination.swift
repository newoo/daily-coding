// 참고 - https://woongsios.tistory.com/179


// MARK: - 경우의 수

/// n개 중에서 r개
/// 5C3 = 4C2 + 4C3 ...
func combination(_ n: Int, _ r: Int) -> Int {
  if [0, n].contains(r) {
    return 1
  }
  
  // selected + unselected
  return combination(n - 1, r - 1) + combination(n - 1, r)
}

combination(5, 3) // 10

// MARK: - 조합 구하기

func combination(origin: [Int], r: Int, idx: Int, selected: [Int]) {
  if r == 0 {
    print(selected)
  } else if idx == origin.count {
    return
  } else {
    // selected
    combination(origin: origin,
                r: r - 1,
                idx: idx + 1,
                selected: selected + [origin[idx]])
    
    // unselected
    combination(origin: origin,
                r: r,
                idx: idx + 1,
                selected: selected)
  }
}

combination(origin: [1,2,3,4,5], r: 3, idx: 0, selected: [])
/*
[1, 2, 3]
[1, 2, 4]
[1, 2, 5]
[1, 3, 4]
[1, 3, 5]
[1, 4, 5]
[2, 3, 4]
[2, 3, 5]
[2, 4, 5]
[3, 4, 5]
*/

func combination(origin: [Int], r: Int, idx: Int, selected: [Int]) -> [[Int]] {
  if r == 0 {
    return [selected]
  } else if idx == origin.count {
    return [[]]
  } else {
    let selected = combination(origin: origin,
                               r: r - 1,
                               idx: idx + 1,
                               selected: selected + [origin[idx]])
    let unselected = combination(origin: origin,
                                 r: r,
                                 idx: idx + 1,
                                 selected: selected)
    return selected + unselected
  }
}

