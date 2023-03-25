//
//  DishCardPreview.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 19.03.2023.
//

import SwiftUI

struct DishCardPreview: View {
    var dish: Dish
    
    var image: String {
        if let image = dish.image {
            return image
        } else {
            return "logoGray"
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.highlightOne)
            VStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(8)
                Text(dish.title)
                    .foregroundColor(Color.primaryOne)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.bottom, 16)
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.primaryOne)
                        .frame(height: 34)
                    Text("$\(String(dish.price))")
                        .foregroundColor(Color.highlightOne)
                        .font(.system(size: 16, weight: .bold))
                }
                .padding(8)
            }
        }
    }
}

struct DishCardPreview_Previews: PreviewProvider {
    static var previews: some View {
        DishCardPreview(dish: Dish(id: "1", title: "Lemon cake", type: .Desserts, price: 7.99, image: "lemon-cake"))
    }
}
