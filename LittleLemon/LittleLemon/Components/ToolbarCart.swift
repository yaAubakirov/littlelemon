//
//  ToolbarCart.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 18.03.2023.
//

import SwiftUI

struct ToolbarCart: View {
    
    var hasItems: Bool
    
    var body: some View {
        ZStack {
            Image(systemName: "cart")
                .foregroundColor(Color.highlightOne)
            Circle()
                .foregroundColor(.red)
                .frame(width: 15)
                .offset(x: 10, y: -10)
                .opacity(hasItems ? 1 : 0)
        }
    }
}

struct ToolbarCart_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarCart(hasItems: true)
    }
}
