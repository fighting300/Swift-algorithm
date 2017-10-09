//: Playground - noun: a place where people can play
import PlaygroundSupport

let beverages = Node(value: "beverage")

let hotBeverage = Node(value: "hot")
let coldBeverage = Node(value: "cold")

let tea = Node(value: "tea")
let coffee = Node(value: "coffee")
let cocoa = Node(value: "cocoa")

let blackTea = Node(value: "black")
let greenTea = Node(value: "green")
let chaiTea = Node(value: "chai")

let soda = Node(value: "soda")
let milk = Node(value: "milk")

let gingerAle = Node(value: "ginger ale")
let bitterLemon = Node(value: "bitter lemon")

beverages.add(child: hotBeverage)
beverages.add(child: coldBeverage)

hotBeverage.add(child: tea)
hotBeverage.add(child: coffee)
hotBeverage.add(child: cocoa)

coldBeverage.add(child: soda)
coldBeverage.add(child: milk)

tea.add(child: blackTea)
tea.add(child: greenTea)
tea.add(child: chaiTea)

soda.add(child: gingerAle)
soda.add(child: bitterLemon)

print(beverages)

beverages.search(value: "cococa")
beverages.search(value: "chai")
beverages.search(value: "bubbly")

let number = Node(value: 5)

PlaygroundPage.current.needsIndefiniteExecution = true

//let url = NSURL(string: "http://httpbin.org/image/png")!
//let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
//    let image = UIImage(data: data!)
//}
//task.resume()

PlaygroundPage.current.finishExecution()


