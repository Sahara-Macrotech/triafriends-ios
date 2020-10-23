//
//  Triage.swift
//  swiftui1
//
//  Created by Abigail Aryaputra Sudarman on 20/10/20.
//

import SwiftUI



//Public
struct Triage: Identifiable {
    
    
    var id: String
    var status: Int
    var name: String
    
  
}

let triages = [
    Triage(id: "1", status: 0, name: "A*** M*** W***"),
    Triage(id: "2", status: 1, name: "I*** S***"),
    Triage(id: "3", status: 1, name: "I*** S***"),
    Triage(id: "4", status: 1, name: "I*** S***"),
    Triage(id: "5", status: 1, name: "I*** S***"),
    Triage(id: "6", status: 1, name: "I*** S***"),
    Triage(id: "7", status: 1, name: "I*** S***"),
    Triage(id: "8", status: 1, name: "I*** S***"),
    Triage(id: "9", status: 1, name: "I*** S***"),
    Triage(id: "10", status: 1, name: "I*** S***"),
    Triage(id: "11", status: 1, name: "I*** S***"),
    Triage(id: "12", status: 1, name: "I*** S***"),
    Triage(id: "13", status: 1, name: "I*** S***"),
    Triage(id: "14", status: 1, name: "I*** S***"),
    Triage(id: "15", status: 1, name: "I*** S***"),
    Triage(id: "16", status: 1, name: "I*** S***"),
    

]









//Medical personal details
struct TriagePatientDetail {
    
   
    
    //Personal data
    var id: String
    var fullname: String
    var dateOfBirth: Date
   
    
    //Determine pediatric/general triage algorithm
    var age: Int

    
    //Cardiology
    var bloodOxygen: Int
    var heartRate: Int
    var bloodPressure: Int
    
    //Pain
    var responsiveToPain: Bool
    var painScale: Int
    
    
    //Respiratory
    var breath: Bool
    
    //Physical
    var burns: Int
    var bodyTemperature: Int
    var bodyTemperatureDuration: Int
    var headInjury: Bool
    
    //Digestion
    var vomit: Bool
    var diarrhea: Bool
    
    
    
    var visum: Bool
    
}
