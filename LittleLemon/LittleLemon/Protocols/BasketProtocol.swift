//
//  BasketProtocol.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 24.03.2023.
//

import Foundation

protocol BasketProtocol {
    var basket: [Dish:Int] { get set }
    
    func getTotalPrice() -> Double
    
    mutating func addDish(_ dish: Dish)
    
    mutating func removeDish(_ dish: Dish)
    
    mutating func clearBusket()
    
    func getQtyOfBusket() -> Int
    
    func hasItems() -> Bool
}
