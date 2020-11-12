//
//  File.swift
//  swiftui1
//
//  Created by Abigail Aryaputra Sudarman on 20/10/20.
//

import Foundation

struct AccountData {
    var username = "dr. Abil Makarim"
    var hospital = "RS Siloam"
    var email = ""
    var phone = ""
    let data = UserDefaults.standard.dictionary(forKey: "credentials")
    
    init() {
        let name = data!["name"] as! String
        if name.contains("dr.")  {
            username = name
        } else {
            username = "dr. \(name)"
        }
        
        let userEmail = data!["email"] as! String
        email = userEmail
        
        let userPhone = data!["phone"] as! String
        phone = userPhone
    }
}
