//
//  QuestionProvider.swift
//  EnhanceQuizStarter
//
//  Created by hamster1 on 3/5/19.
//  Copyright © 2019 Treehouse. All rights reserved.
//
import GameKit

struct QuestionProvider {
    let trivia: [[String : String]] = [
        ["Question": "Only female koalas can whistle", "Answer": "False"],
        ["Question": "Blue whales are technically whales", "Answer": "True"],
        ["Question": "Camels are cannibalistic", "Answer": "False"],
        ["Question": "All ducks are birds", "Answer": "True"]
    ]
    
    var indexOfSelectedQuestion = 0
    
    mutating func randomQuestion() -> [String: String] {
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count)
        let questionDictionary = trivia[indexOfSelectedQuestion]
        return questionDictionary
    }
    
    func getSelectedIndex() -> Int {
        return indexOfSelectedQuestion
    }
    
    func getSelectedQuestionDict(selectedIndex index:Int) -> [String: String] {
        return trivia[index]
    }
}
