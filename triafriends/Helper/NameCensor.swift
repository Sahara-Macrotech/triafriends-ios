//
//  NameCensor.swift
//  triafriends
//
//  Created by Abigail Aryaputra Sudarman on 24/10/20.
//

import Foundation

var namagw = "Nadia Nazla"

func maskingName(name: String) -> String {
    let separatedName = name.components(separatedBy: " ")
    var perword : String = ""
    var modifiedName: [String] = []
    var fixedStringName: String = ""
    for word in separatedName {
        let range = word.index(after: word.startIndex)..<word.endIndex
        perword = word.replacingCharacters(in: range, with: amountOfStar(amount: word.count) )
        modifiedName.append(perword)
    }
    fixedStringName = modifiedName.joined(separator: " ")
    return fixedStringName
}

func amountOfStar(amount: Int) -> String {
    var star: String = ""
    for _ in 1..<amount {
        star += "*"
    }
    return star
}

func initialNameWithoutStars(name: String) -> String {
    var output: String
    var separatedName = name.components(separatedBy: " ")
    var joinedName:[String] = []
    for word in separatedName {
        var x = word.prefix(1).uppercased()
        
        joinedName.append(x)
        
    }
    
    output = joinedName.joined(separator: " ")
    return output
}
