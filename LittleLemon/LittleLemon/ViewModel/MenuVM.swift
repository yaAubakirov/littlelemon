//
//  MenuVM.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 15.03.2023.
//

import Foundation

class MenuVM: ObservableObject {
        
    @Published var dishes: [any DishProtocol] = []
    
    var dataSource: DishFetchProtocol? {
        didSet {
            if let source = dataSource {
                dishes = source.fetchDishes()
            }
        }
    }
    
    @Published var basket: BasketProtocol?
    
    init() {
        print("MenuVM initialized")
        self.dataSource = DishFetch()
        self.basket = Basket(basket: [:])
        
        self.dishes = dataSource?.fetchDishes() ?? []
    }
}
