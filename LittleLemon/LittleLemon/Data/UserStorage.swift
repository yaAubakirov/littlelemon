//
//  UserStorage.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 12.03.2023.
//

import Foundation

class UserStorage: UserStorageProtocol {
    
    private var storage = UserDefaults.standard
    
    func load() -> UserProtocol {
        let firstName = storage.string(forKey: UserConst.kFirstName)
        let lastName = storage.string(forKey: UserConst.kLastName)
        let email = storage.string(forKey: UserConst.kEmail)
        
        return User(firstName: firstName ?? "", lastName: lastName ?? "", email: email ?? "")
    }
    
    func save(user: UserProtocol) {
        storage.set(user.firstName, forKey: UserConst.kFirstName)
        storage.set(user.lastName, forKey: UserConst.kLastName)
        storage.set(user.email, forKey: UserConst.kEmail)
    }
    
    static func logUser() {
        UserDefaults.standard.set(true, forKey: "kUserLogged")
    }
    
    static func logOutUser() {
        UserDefaults.resetStandardUserDefaults()
    }
    
    static func isUserLogged() -> Bool {
        UserDefaults.standard.bool(forKey: "kUserLogged")
    }
}
