//
//  DishProtocol.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 15.03.2023.
//

import Foundation

protocol DishProtocol: Identifiable, Equatable {
    var id: String { get }
    var title: String { get }
    var type: DishType { get }
    var price: Double { get }
    
    func hash(into hasher: inout Hasher)
}

extension DishProtocol {
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
