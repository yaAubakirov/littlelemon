//
//  ContentView.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 12.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State var isLoggedIn: Bool
    
    init() {
        let loggingStatus = UserStorage.isUserLogged()
        self._isLoggedIn = State(initialValue: loggingStatus)
    }
    var body: some View {
        NavigationStack {
            if !isLoggedIn {
                Onboarding(isLoggedIn: $isLoggedIn)
            } else {
                Home()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
