//
//  Account.swift
//  Voluntracker
//
//  Created by Putti, Sri Vamsi K on 1/18/22.
//

import Foundation

struct Account {
    
    var username : String
    var password : String
    
    init(username : String, password : String) {
        self.username = username
        self.password = password
    }
    
    func getUsername() -> String {
        return username
    }
    
    func getPassword() -> String {
        return password
    }
}
