//
//  Onboarding.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 12.03.2023.
//

import SwiftUI

struct Onboarding: View {
    
    private var userStorage: UserStorageProtocol!
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    
    @State var alertIsPresented = false
    @State var alertNotCorrectEmail = false
    
    @Binding var isLoggedIn: Bool
    
    init(isLoggedIn: Binding<Bool>) {
        self.userStorage = UserStorage()
        self._isLoggedIn = isLoggedIn
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("logoGray")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .padding(.top, 32)
                Text("Little Lemon, your local Miditerranean Bistro")
                    .foregroundColor(Color.primaryOne)
                    .font(.system(.headline, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 50)
                    .padding(.vertical, 20)
                Form {
                    Section {
                        TextField("First name", text: $firstName)
                            .disableAutocorrection(true)
                    }
                    .listRowBackground(Color.highlight)
                    .disableAutocorrection(true)
                    Section {
                        TextField("Last name", text: $lastName)
                            .disableAutocorrection(true)
                    }
                    .listRowBackground(Color.highlight)
                    .disableAutocorrection(true)
                    Section {
                        TextField("Email", text: $email)
                            .textInputAutocapitalization(.never)
                    }
                    .listRowBackground(Color.highlight)
                    .disableAutocorrection(true)
                    Section {
                        Button {
                            if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                                if !User.isValidEmail(email) {
                                    alertNotCorrectEmail = true
                                }
                                let user = User(
                                    firstName: firstName,
                                    lastName: lastName,
                                    email: email
                                )
                                userStorage.save(user: user)
                                UserStorage.logUser()
                                withAnimation(.easeIn) {
                                    isLoggedIn = true
                                }
                            } else {
                                alertIsPresented = true
                            }
                        } label: {
                            Text("Register")
                                .foregroundColor(Color.highlight)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .alert(isPresented: $alertIsPresented) {
                            Alert(title: Text("All fields shall be filled"))
                        }
                    }
                    .listRowBackground(Color.primaryOne)
                }
                .scrollContentBackground(.hidden)
            }
            .padding(20)
            .alert(isPresented: $alertNotCorrectEmail) {
                Alert(title: Text("Email address is not valid"))
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding(isLoggedIn: .constant(false))
    }
}
