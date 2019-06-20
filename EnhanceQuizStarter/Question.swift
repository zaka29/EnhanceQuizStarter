//
//  Question.swift
//  EnhanceQuizStarter
//
//  Created by hamster1 on 7/5/19.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import UIKit

class Question {
    let answers: [String]
    let answer: String
    let text: String
    var correctAnswer: Bool
    
    init(questionText text: String, questionAnswer answer: String, allPossibleAnswers answers: [String]) {
        self.text = text
        self.answers = answers
        self.answer = answer
        self.correctAnswer = false
    }
    
    func getText() -> String {
        return text
    }
    
    func getCorrectAnswer() -> String {
        return answer
    }
    
    func getAnswer(answerNumber index: Int) -> String {
        return answers[index]
    }
    
    func isAnsweredCorrect() -> Bool {
        return correctAnswer
    }
    
    func checkAnswer(buttonPressed tag: Int) {
        if (answers[tag] == answer) {
            self.correctAnswer = true
        } else {
            self.correctAnswer = false
        }
        
    }
    
    func getCorrectAnswerButtonIndex() -> Int {
        return self.answers.firstIndex(of: self.answer)!
    }
}

