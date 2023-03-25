//
//  DishCardButton.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 18.03.2023.
//

import SwiftUI

struct DishCardButton: View {
    @Binding var itemsCount: Int
    
    var onTap: (() -> Void)?

    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.primaryOne)
                    .frame(width: 45, height: 34)
                Image(systemName: "plus")
                    .foregroundColor(Color.highlightOne)
                    .font(.system(size: 24))
            }
//                .offset(x: tapped ? 0 : -200)
            .onTapGesture {
                itemsCount += 1
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.primaryOne)
                    .frame(width: 45, height: 34)
                    .opacity(0)
                Text(String(itemsCount))
                    .foregroundColor(Color.primaryOne)
                    .font(.system(size: 20, weight: .bold))
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.primaryOne)
                    .frame(width: 45, height: 34)
                Image(systemName: "minus")
                    .foregroundColor(Color.highlightOne)
                    .font(.system(size: 24))
            }
//                .offset(x: tapped ? 0 : +200)
            .onTapGesture {
                if itemsCount > 1 {
                    itemsCount -= 1
                } else {
                    itemsCount = 1
                }
            }
        
            ZStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.primaryOne)
                        .frame(height: 34)
                    Text("Add")
                        .foregroundColor(Color.highlightOne)
                        .font(.system(size: 18, weight: .semibold))
                }
            }
            .padding(.leading, 40)
            .onTapGesture {
                onTap?()
            }
        }
    }
}

struct DishCardButton_Previews: PreviewProvider {
    struct DishCardButtonTappedContainer: View {
        @State var itemsCount = 1
        var body: some View {
            DishCardButton(itemsCount: $itemsCount, onTap: nil)
        }
    }
    static var previews: some View {
        DishCardButtonTappedContainer()
    }
}
