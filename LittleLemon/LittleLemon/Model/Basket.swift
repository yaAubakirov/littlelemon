//
//  Busket.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 24.03.2023.
//

import Foundation

struct Basket: BasketProtocol {
    
    var basket: [Dish : Int]
            
    func getTotalPrice() -> Double {
        var amount: Double = 0
        for (dish, count) in basket {
            amount += dish.price * Double(count)
        }
        return amount
    }
    
    mutating func addDish(_ dish: Dish) {
        guard let qty = basket[dish] else {
            basket[dish] = 1
            print("New dish \(dish.title) is added")
            return
        }
        basket[dish] = qty + 1
        print("Quantity of dish \(dish.title) is changed to \(qty + 1)")
    }
    
    mutating func removeDish(_ dish: Dish) {
        basket[dish] = nil
        print("Dish \(dish.title) removed")
    }
    
    mutating func clearBusket() {
        for key in basket.keys {
            removeDish(key)
        }
    }
    
    func getQtyOfDish(_ dish: Dish) -> Int {
        if let qty = basket[dish] {
            return qty
        } else {
            return 0
        }
    }
    
    func hasItems() -> Bool {
        !basket.isEmpty
    }
    
    func getQtyOfBusket() -> Int {
        self.basket.count
    }
}
//
//extension Basket: RandomAccessCollection {
//    typealias Element = (key: Dish, value: Int)
//    
//    var sortedBasket: [Element] {
//        return self.basket.sorted(by: { $0.key.title < $1.key.title })
//    }
//    
//    var startIndex: Int { return sortedBasket.startIndex }
//    var endIndex: Int { return sortedBasket.endIndex }
//    func index(after i: Int) -> Int { return sortedBasket.index(after: i) }
//    subscript(position: Int) -> Element {
//        return sortedBasket[position]
//    }
//}
