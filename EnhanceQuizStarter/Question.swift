//
//  Question.swift
//  EnhanceQuizStarter
//
//  Created by hamster1 on 7/5/19.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import UIKit

class Question {
    let answer: String
    let text: String
    var correctAnswer: Bool
    
    init(questionText text: String, questionAnswer answer: String) {
        self.text = text
        self.answer = answer
        self.correctAnswer = false
    }
    
    func getText() -> String {
        return text
    }
    
    func getAnswer() -> String {
        return answer
    }
    
    func isAnsweredCorrect() -> Bool {
        return correctAnswer
    }
    
    func checkAnswer(_ sender: UIButton, buttonTrue senderTrue: Bool, buttonFalse senderFalse: Bool) {
        
        if (senderTrue && answer == "True") || (senderFalse && answer == "False") {
            self.correctAnswer = true
        } else {
            self.correctAnswer = false
        }
    }
}
