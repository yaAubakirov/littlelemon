//
//  Menu.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 12.03.2023.
//

import SwiftUI

struct Menu: View {
    
    @EnvironmentObject var menu: MenuVM
    
    @State var currentSelector: DishType? = nil
    @State var itemsCount: Int = 1
    @State private var dishCardIsPresented = false
    
    @State private var selectedDish: Dish? = nil
    
    @Binding var tabSelection: Int
    
    init(tabSelection: Binding<Int>) {
        self._tabSelection = tabSelection
                
        // MARK: - Design
        // Make the navigation bar transparent
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor(Color.primaryOne)
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    let columns = [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16)
        ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.primaryOne.edgesIgnoringSafeArea(.all)
                Rectangle()
                    .frame(height: 0)
                    .opacity(0)
                List {
                    Hero()
                        .padding(.horizontal, -32)
                        .padding(.vertical, -4)
                        .padding(.bottom, -32)
                    Section {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(menu.dishes, id: \.id) { dish in
                                if dish.type == currentSelector || currentSelector == nil {
                                    DishCardPreview(dish: dish as! Dish)
                                        .onTapGesture {
                                            selectedDish = dish as? Dish
                                        }
                                }
                            }
                        }
                    } header: {
                        DishTypeSelector(currentSelector: $currentSelector)
                            .background(Color.primaryOne)
                            .listRowInsets(EdgeInsets(
                                top: 0,
                                leading: 0,
                                bottom: 0,
                                trailing: 0))
                    }
                }
                .listStyle(.plain)
                .sheet(item: $selectedDish) { dish in
                    DishCard(dish: dish)
                        .environmentObject(menu)
                        .presentationDetents([.medium])
                }
            }
            .background(Color.primaryOne)
            .navigationBarTitle("", displayMode: .inline)
            .toolbar {
                if tabSelection == 1 {
                    ToolbarItem {
                        ToolbarCart(hasItems: menu.basket?.hasItems() ?? false)
                            .onTapGesture {
                                tabSelection = 3
                            }
                    }
                }
            }
        }
    }
}

struct Menu_Previews: PreviewProvider {
    
    static var previews: some View {
        Menu(tabSelection: .constant(1))
            .environmentObject(MenuVM())
    }
}
