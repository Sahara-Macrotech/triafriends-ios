//
//  QuestionModel.swift
//  LearningSwiftUI
//
//  Created by Alvian Gozali on 28/10/20.
//  Copyright © 2020 Alvian Gozali. All rights reserved.
//

import Foundation
import Firebase

class Questions {
    var question: String
    var options: [String]
    
    init(question: String, options: [String]) {
        self.question = question
        self.options = options
    }
}

class TempTriageResult {
    private var name: String = ""
    private var phoneNumber: String = ""
    private var triageDate: Date = Date()
    private var triageResult: String = ""
    private var airway: String = ""
    private var respitoryDistress: String = ""
    private var speak: String = ""
    private var breath: String = ""
    private var hipoventilasi: String = ""
    private var emodynamicDistrubance: String = ""
    private var pulse: String = ""
    private var bleeding: String = ""
    private var skinCondition: String = ""
    private var GCS: String = ""
    private var mentalState: String = ""
    private var createdTime: Double = 0.0
    
    func setName(name: String) {
        self.name = name
    }
    func getName() -> String {
        return self.name
    }
    func setCreatedTime(createdTime: Double) {
        self.createdTime = createdTime
    }
    func getCreatedTime() -> Double {
        return self.createdTime
    }
    
    func setPhoneNumber(phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }
    func getPhoneNumber() -> String {
        return self.phoneNumber
    }
    
    func setTriageDate(triageDate: Date) {
        self.triageDate = triageDate
    }
    func getTriageDate() -> Date {
        return self.triageDate
    }
    
    func setTriageResult(triageResult: String) {
        self.triageResult = triageResult
    }
    func getTriageResult() -> String {
        return self.triageResult
    }
    
    func setAirway(airway: String) {
        self.airway = airway
    }
    func getAirway() -> String {
        return self.airway
    }
    
    func setRespitoryDistress(respitoryDistress: String) {
        self.respitoryDistress = respitoryDistress
    }
    func getRespitoryDistress() -> String {
        return self.respitoryDistress
    }
    
    func setSpeak(speak: String) {
        self.speak = speak
    }
    func getSpeak() -> String {
        return self.speak
    }
    
    func setBreath(breath: String) {
        self.breath = breath
    }
    func getBreath() -> String {
        return self.breath
    }
    
    func setHipoventilasi(hipoventilasi: String) {
        self.hipoventilasi = hipoventilasi
    }
    func getHipoventilasi() -> String {
        return self.hipoventilasi
    }
    
    func setEmodynamicDisturbance(emodynamicDistrubance: String) {
        self.emodynamicDistrubance = emodynamicDistrubance
    }
    func getEmodynamicDisturbance() -> String {
        return self.emodynamicDistrubance
    }
    
    func setPulse(pulse: String) {
        self.pulse = pulse
    }
    func getPulse() -> String {
        return self.pulse
    }
    
    func setBleeding(bleeding: String) {
        self.bleeding = bleeding
    }
    func getBleeding() -> String {
        return self.bleeding
    }
    
    func setSkinCondition(skinCondition: String) {
        self.skinCondition = skinCondition
    }
    func getSkinCondition() -> String {
        return self.skinCondition
    }
    
    func setGCS(GCS: String) {
        self.GCS = GCS
    }
    func getGCS() -> String {
        return self.GCS
    }
    
    func setMentalSTate(mentalState: String) {
        self.mentalState = mentalState
    }
    func getMentalState() -> String {
        return self.mentalState
    }
    
}
