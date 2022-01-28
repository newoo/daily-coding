//: [Previous](@previous)

import Foundation

let queue = DispatchQueue.init(label: "", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: .none)

func bar() {
    queue.async {
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].forEach {
            print ($0)
        }
    }
    
    ["!", "@", "#", "$", "%", "^", "&", "*", "(", ")"].forEach {
        print ($0)
    }
    
    queue.sync {
        ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"].forEach {
            print($0)
        }
    }
}

bar()

//: [Next](@next)
