func solution(_ n:Int, _ times:[Int]) -> Int64 {
  Int64(findCounter(times: times, original: times, n: n - 1))
}

func findCounter(times: [Int], original: [Int], n: Int) -> Int {
  var times = times
  
  guard let min = times.enumerated().min(by: { $0.element < $1.element }) else {
    return 0
  }
  
  if n == 0 {
    return min.element
  }
  
  times[min.offset] = min.element + original[min.offset]
  
  return findCounter(times: times, original: original, n: n - 1)
}

print(solution(6, [7, 10])) // 28
