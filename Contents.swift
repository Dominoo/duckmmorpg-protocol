
import UIKit

//: Protocols for our MMORPG
protocol Quackable {
    func quack()
}

protocol Swimable {
    func swim()
}


protocol Duck : Swimable {
    var name : String { get }
    
    typealias Expertise
    func evaluate(item : Expertise)
    
}


//: Flying Stuff
protocol FlyBehaviour {
    mutating func performFly()
}

protocol Flyable {
    var flyBehaviour : FlyBehaviour { get set }
    mutating func fly()
}

struct WingFlyable : FlyBehaviour {
    func performFly() {
        print("I am flying with the wings!")
    }
}

enum StateFlyable : FlyBehaviour {
    case On
    case Off
    
    func performFly() {
        switch self {
        case .On:
            print("I Believe I can Fly")
            
        case .Off:
            print("I can not fly")
        }
    }
}

struct OneTimeFlyable : FlyBehaviour {
    
    var state = true
    
    mutating func performFly() {
        if state {
            print("I flew once...I didnt like it")
            state = false
        } else {
            print("As I said I dont want to fly again")
        }
    }
}



//: Protocol Extension will make some default behaviours

extension Duck where Expertise == String {
    
    func evaluate(item: String) {
        if item.characters.count > 10 {
            print("I Like long Strings")
        } else {
            print("Short strings are not for me!")
        }
    }
    
    
}

extension Duck {
    func swim() {
        print("Ofcourse I can Swim I am a Duck")
    }
    
    func evaluate(item : Int) {
        if item > 10 {
            print("I think numbers greater than 10 are really great")
        } else {
            print("I dont like small numbers")
        }
    }

    
}

extension Duck where Self : Quackable {
    func quack() {
        print("Quack")
    }
}




//: Lets create some ducks!

struct OrdinaryDuck : Duck, Quackable, Flyable {
    //Duck protocol
    let name = "Ordinary Duck"
    
    typealias Expertise = Int

    //Flyable protocol
    var flyBehaviour : FlyBehaviour
    
    mutating func fly() {
        flyBehaviour.performFly()
    }
    
    init() {
        flyBehaviour = WingFlyable()
    }

}

struct RubberDuck : Duck, Quackable {
    let name = "Rubber Duck"
    
    typealias Expertise = Int

    
    func quack() {
        print("Squeeeek")
    }
}

struct NinjaDuck : Duck {
    
    let name = "Ninja Duck"
    
    typealias Expertise = String
    
    
}



var ordinary = OrdinaryDuck()
let rubber = RubberDuck()
let ninja = NinjaDuck()

ordinary.flyBehaviour = OneTimeFlyable()
ordinary.fly()

//:Testing Code
ordinary.quack()
ordinary.fly()

rubber.quack()
ninja.swim()

ninja.evaluate("1")
rubber.evaluate(11)


func flyingDuckArgumentFunction(duck : protocol<Swimable,Flyable>) {
    
}

