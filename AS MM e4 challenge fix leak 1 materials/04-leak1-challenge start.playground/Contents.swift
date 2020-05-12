// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.


/* HINT: use a class like this! ;]

 */

final class Unowned<T: AnyObject> {
    unowned let value: T
    init (_ value: T) {
        self.value = value
    }
}

class Person {
    var name: String
    var friends: [Unowned<Person>] = []
    init(name: String) {
        self.name = name
        print("Hello: \(name)")
    }
    
    deinit {
        print("Goodbye \(name)")
    }
}

do {
    let ray = Person(name: "Ray")
    let vicki = Person(name: "Vicki")
    let greg = Person(name: "Greg")
    let tammy = Person(name: "Tammy")
    let darren = Person(name: "Darren")
    let richard = Person(name: "Richard")
    
    ray.friends.append(contentsOf: [vicki,tammy,
                                    richard,greg,
                                    darren].map { Unowned($0) })
    vicki.friends.append(contentsOf: [ray,tammy,
                                      richard,greg,
                                      darren].map{ Unowned($0) })
}




class Cat {
    func speak() { print("meow") }
}




//let play = { [cat = whiskers ] in
//    cat.speak()
//}
//if we use weak we have to unwrapp it and create a copy of that


do {
    let whiskers = Cat()
    let play2 = { [weak cat = whiskers ] in
        guard let cat = cat else {
            print("No playtime today")
            return
        }
        cat.speak()
    }
    play2()
}
