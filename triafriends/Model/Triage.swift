//
//  Triage.swift
//  swiftui1
//
//  Created by Abigail Aryaputra Sudarman on 20/10/20.
//

import SwiftUI


struct Filter {
    
    var filterTypes: Filters
    enum Filters {
        case all
        case queue
        case handled
        case done
    }
    
    }
//Public
struct Triage: Identifiable {
    
    
    var id: String
    var status: Int
    var name: String
    var patientState: PatientState
    enum PatientState {
        case queue
        case handled
        case done
        
    }
    
  
}

//Dummy datas
var triages = [
    Triage(id: "1", status: 0, name: "A*** M*** W***", patientState: .queue),
    Triage(id: "2", status: 1, name: "C*** S***", patientState: .queue),
    Triage(id: "3", status: 1, name: "I*** S***", patientState: .queue),
    Triage(id: "4", status: 1, name: "I*** S***", patientState: .queue),
    Triage(id: "5", status: 1, name: "I*** S***", patientState: .queue),
    Triage(id: "6", status: 1, name: "I*** S***", patientState: .queue),
    Triage(id: "7", status: 1, name: "I*** S***", patientState: .queue),
    Triage(id: "8", status: 1, name: "I*** S***", patientState: .queue),
    Triage(id: "9", status: 1, name: "I*** S***", patientState: .handled),
    Triage(id: "10", status: 1, name: "H*** H***", patientState: .handled),
    Triage(id: "11", status: 1, name: "H*** H***", patientState: .handled),
    Triage(id: "12", status: 1, name: "I*** S***", patientState: .queue),
    Triage(id: "13", status: 1, name: "I*** S***", patientState: .queue),
    Triage(id: "14", status: 1, name: "I*** S***", patientState: .queue),
    Triage(id: "15", status: 1, name: "D*** D***", patientState: .done),
    Triage(id: "16", status: 1, name: "D*** D***", patientState: .done),
    

]

var arr = ["ab","cc","dd","ae"]

//
//arr.filter { (str) -> Bool in
//    return str.contains("a")

//
//triages.filter { (Triage) -> Bool in
//  return  Triage.patientState == .done

//}
