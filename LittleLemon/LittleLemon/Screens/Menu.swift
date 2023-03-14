//
//  Menu.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 12.03.2023.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                Hero()
                DishTypeSelector()
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
