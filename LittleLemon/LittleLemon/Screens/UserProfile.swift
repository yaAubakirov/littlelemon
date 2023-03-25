//
//  UserProfile.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 13.03.2023.
//

import SwiftUI

struct UserProfile: View {
    
    private var userStorage: UserStorageProtocol!
    
    @Binding var tabSelection: Int
    
    @State private var firstName: String
    @State private var lastName: String
    @State private var email: String
    
    @State private var editMode: Bool = true
    
    init(tabSelection: Binding<Int>) {
        self._tabSelection = tabSelection
        self.userStorage = UserStorage()
        let user = self.userStorage.load()
        self._firstName = State(initialValue: user.firstName)
        self._lastName = State(initialValue: user.lastName)
        self._email = State(initialValue: user.email)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.primaryOne.edgesIgnoringSafeArea(.all)
                List {
                    Section {
                        HStack {
                            Image("logoGray")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.primaryOne, lineWidth: 4))
                            Text("Status:")
                                .padding(.leading, 24)
                                .foregroundColor(Color.primaryOne)
                                .font(.system(.headline, weight: .semibold))
                            Text("Golden")
                                .foregroundColor(Color.primaryTwo)
                                .font(.system(.headline, weight: .semibold))
                        }
                        .listRowBackground(Color.clear)
                    }
                    .padding(.top, 20)
                    Section {
                        TextField("", text: $firstName)
                            .disabled(editMode)
                            .foregroundColor(editMode ? Color.gray : .primary)
                        TextField("", text: $lastName)
                            .disabled(editMode)
                            .foregroundColor(editMode ? Color.gray : .primary)
                        TextField("", text: $email)
                            .disabled(editMode)
                            .foregroundColor(editMode ? Color.gray : .primary)
                    }
                    Section {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.clear)
                            Text("Log out")
                                .foregroundColor(Color.primaryOne)
                                .font(.system(.headline, weight: .semibold))
                        }
                        .listRowBackground(Color.primaryTwo)
                        .onTapGesture {
                            UserStorage.logOutUser()
                        }
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .toolbar {
                if tabSelection == 2 {
                    ToolbarItem {
                        Button {
                            if !editMode {
                                let user = User(
                                    firstName: firstName,
                                    lastName: lastName,
                                    email: email
                                )
                                userStorage.save(user: user)
                                editMode = true
                            } else {
                                editMode = false
                            }
                        } label: {
                            Text(editMode ? "Edit" : "Save")
                                .foregroundColor(Color.highlightOne)
                        }
                    }
                }
            }
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile(tabSelection: .constant(2))
    }
}
