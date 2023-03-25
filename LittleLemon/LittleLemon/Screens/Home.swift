//
//  Home.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 12.03.2023.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var menu: MenuVM
    
    @State private var tabSelection = 1
    
    var body: some View {
        TabView(selection: $tabSelection) {
            Menu(tabSelection: $tabSelection)
                .environmentObject(menu)
                .tabItem({
                    Label("Menu", systemImage: "list.dash")
                })
                .tag(1)
            UserProfile(tabSelection: $tabSelection)
                .tabItem({
                    Label("User Profile", systemImage: "person")
                })
                .tag(2)
            Cart(tabSelection: $tabSelection)
                .environmentObject(menu)
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
                .badge(menu.basket?.getQtyOfBusket() ?? 0)
                .tag(3)
        }
        .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(MenuVM())
    }
}
