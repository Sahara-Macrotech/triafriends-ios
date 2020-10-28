//
//  TriageViewModel.swift
//  LearningSwiftUI
//
//  Created by Alvian Gozali on 28/10/20.
//  Copyright © 2020 Alvian Gozali. All rights reserved.
//

import Foundation

class TriageViewModel {
    var questions = [Questions]()
    
    init() {
        questions.append(Questions.init(question: "How is the airway", options: [Options.init(option: "Total Blockage"), Options.init(option: "Partial Blockage"), Options.init(option: "Patent Blockage")]))
        questions.append(Questions.init(question: "How is the respiratory distress", options: [Options.init(option: "Severe respiratory distress"), Options.init(option: "Moderate respiratory distress"), Options.init(option: "No distress respiratory distress"), Options.init(option: "RR is normal")]))
        questions.append(Questions.init(question: "Unable to speak", options: [Options.init(option: "RR>30 x/minute"), Options.init(option: "RR<30 x/Minute"), Options.init(option: "RR is normal"), Options.init(option: "Can communicate well")]))
        
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

