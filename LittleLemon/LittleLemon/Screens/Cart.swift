//
//  Cart.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 18.03.2023.
//

import SwiftUI

struct Cart: View {
    
    @EnvironmentObject var menu: MenuVM
    
    @Binding var tabSelection: Int
    
    @State var isOrdered: Bool = true
    
    var basket: [Dish : Int] {
        if let basket = self.menu.basket?.basket {
            return basket
        } else {
            print("Nothing in basket for Cart")
            return [:]
        }
    }
    
    init(tabSelection: Binding<Int>) {
        self._tabSelection = tabSelection
    }
        
    var body: some View {
        NavigationStack {
            ZStack {
                Color.primaryOne.edgesIgnoringSafeArea(.all)
                List {
                    if !basket.isEmpty {
                        Section("Order summary") {
                            ForEach(basket.sorted(by: { $0.key.title < $1.key.title }), id: \.key) { dish, qty in
                                HStack {
                                    Text("\(String(qty)) x \(dish.title)")
                                    Spacer()
                                    Text(String(dish.price))
                                }
                            }
                            .onDelete(perform: deleteDishFromCart)
                        }
                        Section {
                            HStack {
                                Text("Total price is:")
                                Spacer()
                                Text("$\(String(menu.basket?.getTotalPrice() ?? 0))")
                            }
                        }
                        
                        Section {
                            Button {
                                deliverOrder()
                            } label: {
                                HStack {
                                    Spacer()
                                    Text("Order")
                                        .foregroundColor(Color.primaryOne)
                                        .font(.system(size: 24, weight: .semibold))
                                    Spacer()
                                }
                            }
                            .listRowBackground(Color.primaryTwo)
                        }
                    } else {
                        Section {
                            if isOrdered {
                                HStack {
                                    Spacer()
                                    Text("On the way")
                                        .foregroundColor(Color.primaryOne)
                                        .font(.system(size: 18, weight: .semibold))
                                    Image(systemName: "box.truck.badge.clock")
                                        .foregroundColor(Color.primaryOne)
                                        .font(.system(size: 18, weight: .semibold))
                                    Spacer()
                                }
                                .listRowBackground(Color.clear)
                            } else {
                                HStack {
                                    Spacer()
                                    Text("Nothing to show")
                                        .foregroundColor(Color.primaryOne)
                                        .font(.system(size: 18, weight: .semibold))
                                    Spacer()
                                }
                                .listRowBackground(Color.clear)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Cart", displayMode: .inline)
        }
    }
    
    func deleteDishFromCart(at offsets: IndexSet) {
        if let index = offsets.first {
            let item = basket.sorted(by: { $0.key.title < $1.key.title })[index]
            menu.basket?.removeDish(item.key)
        }
    }
    
    func deliverOrder() {
        menu.basket?.clearBusket()
        isOrdered = true
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        Cart(tabSelection: .constant(3))
            .environmentObject(MenuVM())
    }
}
