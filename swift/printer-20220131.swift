func solution(_ priorities:[Int], _ location:Int) -> Int {
  return pop(queue: priorities.enumerated().map { ($0, $1) }, location: location, max: priorities.max() ?? 9, count: 0)
}

func pop(queue: [(Int, Int)], location: Int, max: Int, count: Int) -> Int {
  var isMatch = false
  
  var _queue = queue
  var count = count
  var newQueue = [(Int, Int)]()
  
  for _ in queue {
    let first = _queue.removeFirst()
    
    if first.1 == max {
      count += 1
      
      if first.0 == location {
        isMatch = true
        break
      }
      
      _queue.append(contentsOf: newQueue)
      newQueue.removeAll()
    } else {
      newQueue.append(first)
    }
  }
  
  if isMatch {
    return count
  }
  
  _queue = newQueue + _queue
  
  return pop(queue: _queue, location: location, max: max - 1, count: count)
}

print(solution([2, 1, 3, 2], 2)) // 1
print(solution([1, 1, 9, 1, 1, 1], 0)) // 5

