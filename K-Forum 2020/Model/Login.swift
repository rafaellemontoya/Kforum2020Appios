//
//  Login.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/29/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import Foundation

class Login: Decodable{
    var email, password: String
    
    init(){
        email = ""
        password = ""
    }
}
