//
//  DishTypeSelectorElement.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 14.03.2023.
//

import SwiftUI

struct DishTypeSelectorElement: View {
    var dishType: DishType
    
    @State var selected: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(selected ? Color.highlightTwo : Color.highlightOne)
                .frame(height: 36)
            Text(dishType.rawValue)
                .foregroundColor(selected ? Color.primaryTwo : Color.primaryOne)
                .font(.system(size: 16, weight: .bold, design: .default))
                .padding(20)
        }
        .onTapGesture {
            withAnimation {
                selected.toggle()
            }
        }
    }
}

struct DishTypeSelectorElement_Previews: PreviewProvider {
    static var previews: some View {
        DishTypeSelectorElement(dishType: .Desserts)
    }
}
