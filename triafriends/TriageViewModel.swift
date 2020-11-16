//
//  TriageViewModel.swift
//  LearningSwiftUI
//
//  Created by Alvian Gozali on 28/10/20.
//  Copyright © 2020 Alvian Gozali. All rights reserved.
//

import Foundation

class TriageViewModel: Identifiable {
    var questions = [Questions]()
    
    
    init() {
        questions.append(Questions.init(question: "Still Alive ?", options: ["No Live Sign & No Pulse", "Alive"]))
        questions.append(Questions.init(question: "How's the airway ?", options: [Triage.JalanNafas.sumbatanTotal.rawValue, Triage.JalanNafas.sumbatanSebagian.rawValue, Triage.JalanNafas.paten.rawValue]))
        questions.append(Questions.init(question: "How's the respiratory distress ?", options: [Triage.Distress.berat.rawValue, Triage.Distress.sedang.rawValue, Triage.Distress.ringan.rawValue, Triage.Distress.tidakAda.rawValue, Triage.Distress.RRnormal.rawValue]))
        questions.append(Questions.init(question: "Can he speak ?", options: [Triage.RespiratoryRate.tidakMampuBicara.rawValue,Triage.RespiratoryRate.RRmorethan30.rawValue, Triage.RespiratoryRate.RRlessthan30.rawValue,Triage.RespiratoryRate.RRnormal.rawValue,Triage.RespiratoryRate.komunikasiBaik.rawValue]))
        questions.append(Questions.init(question: "How is the breath ?", options: [Triage.HentiNafas.berhenti.rawValue,Triage.HentiNafas.pengunaanOtotBantu.rawValue, Triage.HentiNafas.normal.rawValue]))
        questions.append(Questions.init(question: "Hipoventilasi ?", options: ["Yes","No"]))
        questions.append(Questions.init(question: "Have emodynamic distrubance ?", options: [Triage.Hemodinamik.berat.rawValue,Triage.Hemodinamik.sedang.rawValue, Triage.Hemodinamik.ringan.rawValue,Triage.Hemodinamik.tidakAda.rawValue]))
        questions.append(Questions.init(question: "How is the condition of the pulse ?", options: [Triage.Nadi.tidakTeraba.rawValue,Triage.Nadi.sangatHalus.rawValue, Triage.Nadi.teraba.rawValue, Triage.Nadi.normal.rawValue]))
        questions.append(Questions.init(question: "Is there any bleeding ?", options: [Triage.DenyutNadi.perdarahanAktif.rawValue,Triage.DenyutNadi.kapilerMorethan2.rawValue, Triage.DenyutNadi.kapilerLessthan2.rawValue, Triage.DenyutNadi.teraba.rawValue]))
        questions.append(Questions.init(question: "How is the skin condition ?", options: [Triage.WarnaKulit.pucatMerahHangat.rawValue,Triage.WarnaKulit.merahHangat.rawValue]))
        
        //NOT CALCULATED YET
        questions.append(Questions.init(question: "Glasgow coma scale ?", options: [Triage.GCS.belowEight.rawValue,Triage.GCS.nineToTwelve.rawValue, Triage.GCS.aboveThirteen.rawValue, Triage.GCS.fifteen.rawValue]))
        
        questions.append(Questions.init(question: "How is his mental state ?", options: [Triage.Psikologis.tidakKooperatif.rawValue,Triage.Psikologis.kooperatif.rawValue]))
        
    }
    
    func getCount(index: Int) -> Int {
        return questions[index].options.count
    }
    

}

