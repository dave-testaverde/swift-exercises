import UIKit

// closure generic foo
var cls: () -> () = {
    print("Foo")
}

// bronze
func addNTimes(_ N: Int, _ cls: ()->()) {
    for i in 1...N {
        cls()
    }
}

// silver
func forEach(array: [Int], _ cls: (Int) -> ()) {
    for elem in array {
        cls(elem)
    }
}

// display foo
addNTimes(1, cls)

// custom lambda
var square: (Int) -> () = { print($0 * $0) }
forEach(array: [2, 3, 4], square)

// custom lambda inline
forEach(array: [5, 6, 7]) { print((3 * $0) * 2) }

