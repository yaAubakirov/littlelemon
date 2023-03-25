//
//  Hero.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 14.03.2023.
//

import SwiftUI

struct Hero: View {
    var body: some View {
        ZStack {
            Color.primaryOne
            VStack {
                HStack {
                    Text("Little Lemon")
                        .foregroundColor(Color.primaryTwo)
                        .font(.system(size: 36, weight: .bold, design: .default))
                    Spacer()
                }
                HStack {
                    VStack {
                        HStack {
                            Text("Chicago")
                                .foregroundColor(Color.highlightOne)
                                .font(.system(size: 24, weight: .bold, design: .default))
                            Spacer()
                        }
                        HStack {
                            Text("Little Lemon is a charming neighborhood bistro thatserves simple food and classic cocktails in a lively but casual environment.")
                                .foregroundColor(Color.highlightOne)
                                .font(.system(size: 16, weight: .regular, design: .default))
                            Image("hero")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120)
                                .clipShape(Circle())
                        }
                        .padding(.top, -32)
                    }
                }
            }
            .padding(8)
            .padding(.horizontal, 24)
        }
    }
}

struct Hero_Previews: PreviewProvider {
    static var previews: some View {
        Hero()
    }
}
