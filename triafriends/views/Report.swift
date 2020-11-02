//
//  Report.swift
//  triafriends
//
//  Created by Iswandi Saputra on 27/10/20.
//

import Foundation

struct Report {
    let year : String
    let revenue: Double
}


extension Report {
    static func all() -> [Report]{
        return [
            Report(year: "2020", revenue: 1500),
            Report(year: "2010", revenue: 500),
            Report(year: "2019", revenue: 400),
            
        ]
    }
}
