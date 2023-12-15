//
//  User.swift
//  ToDoList
//
//  Created by Sativa Maciel` on 12/15/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
