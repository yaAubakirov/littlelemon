//
//  DishFetch.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 15.03.2023.
//

import Foundation

class DishFetch: DishFetchProtocol {
    func fetchDishes() -> [any DishProtocol] {
        print("Dishes from dish fetch were fetched")
        return [
            Dish(id: "1", title: "Greek Salad", type: .Starters, price: 7.99, image: "greek-salad"),
            Dish(id: "2", title: "Caprese", type: .Starters, price: 8.99, image: "caprese"),
            Dish(id: "3", title: "Carbonara", type: .Mains, price: 9.99, image: "carbonara"),
            Dish(id: "4", title: "Arabiatta", type: .Mains, price: 7.99, image: "pasta"),
            Dish(id: "5", title: "Pizza Pepperoni", type: .Mains, price: 10.59, image: "pepperoni"),
            Dish(id: "6", title: "Tiramisu", type: .Desserts, price: 5.99, image: "tiramisu"),
            Dish(id: "7", title: "Espresso", type: .Drinks, price: 2.39, image: "espresso"),
            Dish(id: "8", title: "Cappuccino", type: .Drinks, price: 3.99, image: "cappuccino"),
            Dish(id: "9", title: "Wine", type: .Drinks, price: 5.99, image: "wine"),
            Dish(id: "10", title: "Water", type: .Drinks, price: 0.99),
            Dish(id: "11", title: "Arabiatta", type: .Mains, price: 7.99, image: "pasta"),
            Dish(id: "12", title: "Pizza Pepperoni", type: .Mains, price: 10.59, image: "pepperoni"),
            Dish(id: "13", title: "Lemon cake", type: .Desserts, price: 5.99, image: "lemon-cake"),
            Dish(id: "14", title: "Espresso", type: .Drinks, price: 2.39, image: "espresso"),
            Dish(id: "15", title: "Cappuccino", type: .Drinks, price: 3.99, image: "cappuccino"),
        ]
    }
}
