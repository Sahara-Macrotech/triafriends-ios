//
//  QuestionModel.swift
//  LearningSwiftUI
//
//  Created by Alvian Gozali on 28/10/20.
//  Copyright © 2020 Alvian Gozali. All rights reserved.
//

import Foundation

class Options {
    var option: String
    
    init(option: String) {
        self.option = option
    }
}

class Questions {
    var question: String
    var options: [Options]
    var optionList = [String]()
    
    init(question: String, options: [Options]) {
        self.question = question
        self.options = options
        setOptionList()
    }
    
    func setOptionList() {
        for option in options {
            optionList.append(option.option)
        }
    }
}
