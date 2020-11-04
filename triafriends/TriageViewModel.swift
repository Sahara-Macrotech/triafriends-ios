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
        questions.append(Questions.init(question: "How's the airway ?", options: ["Total Blockage", "Partial Blockage", "Patent"]))
        questions.append(Questions.init(question: "How's the respiratory distress ?", options: ["Severe respiratory distress", "Moderate respiratory distress", "Light respitory distress", "No distress exhalation", "RR is normal"]))
        questions.append(Questions.init(question: "Can he speak ?", options: ["Unable to speak","RR>30 x/minute", "RR<30 x/Minute","RR is normal","Can communicate well"]))
        questions.append(Questions.init(question: "How is the breath ?", options: ["Stop Breathing","Use of auxilliary muscles breath"]))
        questions.append(Questions.init(question: "Hipoventilasi ?", options: ["Yes","No"]))
        questions.append(Questions.init(question: "Have emodynamic distrubance ?", options: ["Severe hemodynamic distrubances","Moderate hemodynamic distrubances", "Mild hemodynamic distrubances","No hemodynamic distrubances"]))
        questions.append(Questions.init(question: "How is the condition of the pulse ?", options: ["Pulse is not palpable / cardiac arrest","Pulse is not palpable / very smooth", "Pulse palpable", "Normal Pulse"]))
        questions.append(Questions.init(question: "Is there any bleeding ?", options: ["Uncontrolled bleeding / active bleeding","Capilarry refill > 2 seconds", "Capilarry refill < 2 seconds", "Peripheral pulse is palpable"]))
        questions.append(Questions.init(question: "How is the skin condition ?", options: ["Pale skin reddish warm acral","Reddish skin warm acral"]))
        questions.append(Questions.init(question: "Glasgow coma scale ?", options: ["Below 8","9-12", "Above 13", "15"]))
        questions.append(Questions.init(question: "How is his mental state ?", options: ["Not cooperative","Cooperative"]))
    }
    
    func getCount(index: Int) -> Int {
        return questions[index].options.count
    }
    
//    func setQuestionList() {
//        for question in questions {
//            for option in question.options {
//                var tempOption = OptionsCell()
//                tempOption.setOption(option: option.option)
//                optionList.append(tempOption)
//            }
//        }
//    }
}

