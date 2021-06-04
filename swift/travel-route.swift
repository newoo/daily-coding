import Foundation

func next(tickets: [[String]], begin: String, route: [String]) -> [[String]] {
  if tickets.isEmpty {
    return [route + [begin]]
  }
  
  var route = route
  route.append(begin)
  
  var routes = [[String]]()
  
  tickets.enumerated().forEach({ offset, ticket in
    if ticket.first == begin, let destination = ticket.last {
      var _tickets = tickets
      _tickets.remove(at: offset)
      routes = routes + next(tickets: _tickets, begin: destination, route: route)
    }
  })
  
  return routes
}

func compare(arr1: [String], arr2: [String]) -> Bool {
  let arr = arr1.count < arr2.count ? arr1 : arr2
  
  var result = true
  
  for (index, _) in arr.enumerated() {
    if arr1[index] == arr2[index] {
      continue
    }
    
    if arr1[index] < arr2[index] {
      result = true
      break
    }
    
    if arr1[index] > arr2[index] {
      result = false
      break
    }
  }
  
  return result
}

func solution(_ tickets:[[String]]) -> [String] {
  var routes = next(tickets: tickets, begin: "ICN", route: [])
  
  routes.sort(by: { $0.count > $1.count })
  
  
  routes.sort(by: {
    compare(arr1: $0, arr2: $1)
  })
  
  return routes.first ?? []
}
