//: [Previous](@previous)

import Foundation

class Doll {
  let name: String
  var doll: Doll?
  
  init(name: String) {
    self.name = name
    print("init: \(name)")
  }
  
  deinit {
    print("deinit: \(name)")
  }
}

var aDoll: Doll? = Doll(name: "A")
var bDoll: Doll? = Doll(name: "B")

print(CFGetRetainCount(aDoll))
print(CFGetRetainCount(bDoll))

//aDoll?.doll = bDoll
bDoll?.doll = aDoll

//print(CFGetRetainCount(aDoll))
//print(CFGetAllocator(aDoll))

aDoll = nil
//bDoll = nil

//print(CFGetRetainCount(aDoll))
//print(CFGetAllocator(aDoll))

//: [Next](@next)
