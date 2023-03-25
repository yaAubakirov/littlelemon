//
//  DishCard.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 19.03.2023.
//

import SwiftUI

struct DishCard: View {
    
    @EnvironmentObject var menu: MenuVM
    
    var dish: Dish
    
    @Environment(\.presentationMode) private var presentationMode
    
    var image: String {
        if let image = dish.image {
            return image
        } else {
            return "logoGray"
        }
    }
    
    @State var itemsCount: Int = 1
    
    var width: CGFloat {
        UIScreen.main.bounds.width - 36
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.highlightOne)
            VStack {
                Capsule()
                        .fill(Color.secondary)
                        .frame(width: 40, height: 6)
                        .padding(10)
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: width, maxHeight: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(8)
                Text(dish.title)
                    .foregroundColor(Color.primaryOne)
                    .font(.system(size: 24, weight: .semibold))
                Text("$\(String(dish.price))")
                    .foregroundColor(Color.primaryOne)
                    .font(.system(size: 24, weight: .semibold))
                    .padding(.bottom, 16)
                DishCardButton(itemsCount: $itemsCount) {
                    for _ in 0..<itemsCount {
                        menu.basket?.addDish(dish)
                    }
                    self.presentationMode.wrappedValue.dismiss()
                    
                }
                .padding(8)
            }
        }
        .padding(.top, 18)
        .padding(.bottom, 40)
        .background(Color.highlightOne.edgesIgnoringSafeArea(.all))
    }
}

struct DishCard_Previews: PreviewProvider {
    static var previews: some View {
        DishCard(dish: Dish(id: "1", title: "Tiramisu", type: .Desserts, price: 7.99, image: "lemon-cake"))
    }
}
