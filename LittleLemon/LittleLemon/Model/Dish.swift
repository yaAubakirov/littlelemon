//
//  Dish.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 15.03.2023.
//

import Foundation

struct Dish: DishProtocol, Hashable {
    var id: String    
    var title: String
    var type: DishType
    var price: Double
    var image: String? = nil
    
    init(id: String, title: String, type: DishType, price: Double, image: String? = nil) {
        self.id = id
        self.title = title
        self.type = type
        self.price = price
        self.image = image
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(type)
        hasher.combine(price)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.type == rhs.type &&
            lhs.price == rhs.price
    }
}
