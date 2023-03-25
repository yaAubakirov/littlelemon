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
    @Binding var currentSelector: DishType?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(selected ? Color.primaryOne : Color.highlightOne)
                .frame(height: 36)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primaryTwo, lineWidth: 1)
                        .opacity(selected ? 1 : 0)
                )
            Text(dishType.rawValue)
                .foregroundColor(selected ? Color.primaryTwo : Color.primaryOne)
                .font(.system(size: 16, weight: .bold, design: .default))
                .padding(20)
        }
        .onTapGesture {
            if currentSelector != dishType {
                currentSelector = dishType
            } else {
                currentSelector = nil
            }
        }
        .onChange(of: currentSelector) { newValue in
            if currentSelector == dishType {
                withAnimation {
                    selected = true
                }
            } else {
                withAnimation {
                    selected = false
                }
            }
        }
    }
}

struct DishTypeSelectorElement_Previews: PreviewProvider {
    static var previews: some View {
        DishTypeSelectorElement(dishType: .Desserts, currentSelector: .constant(.Desserts))
    }
}
