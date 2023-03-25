//
//  DishFetchProtocol.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 15.03.2023.
//

import Foundation

protocol DishFetchProtocol: AnyObject {
    // get menu from somewhere
    func fetchDishes() -> [any DishProtocol]
}
