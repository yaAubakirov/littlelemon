//
//  UserStorageProtocol.swift
//  LittleLemon
//
//  Created by Baurzhan Aubakirov on 12.03.2023.
//

import Foundation

protocol UserStorageProtocol {
    // load user data
    func load() -> UserProtocol
    // save user data
    func save(user: UserProtocol)
}
