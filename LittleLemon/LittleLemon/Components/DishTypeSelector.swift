//
//  DishTypeSelector.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 14.03.2023.
//

import SwiftUI

struct DishTypeSelector: View {
    
    @Binding var currentSelector: DishType?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Rectangle()
                    .opacity(0)
                ForEach(DishType.allCases, id: \.self) { dish in
                    DishTypeSelectorElement(dishType: dish, currentSelector: $currentSelector)
                }
                Rectangle()
                    .opacity(0)
            }
        }
    }
}

struct DishTypeSelector_Previews: PreviewProvider {
    static var previews: some View {
        DishTypeSelector(currentSelector: .constant(.Desserts))
    }
}
