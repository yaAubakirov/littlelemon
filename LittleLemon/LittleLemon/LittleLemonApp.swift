//
//  LittleLemonApp.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 12.03.2023.
//

import SwiftUI

@main
struct LittleLemonApp: App {
    
    var menu = MenuVM()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(self.menu)
        }
    }
}
