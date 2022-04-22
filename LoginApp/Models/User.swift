//
//  User.swift
//  LoginApp
//
//  Created by Вячеслав Кусакин on 22.04.2022.
//

import Foundation

struct User {
    let username: String
    let password: String
    let photo: String
    let bank: String

    static func getUser() -> User {
        User(
            username: "Uncle",
            password: "777",
            photo: "UnclePennibags",
            bank: String(Int.random(in: 0...1_000))
        )
    }
}
