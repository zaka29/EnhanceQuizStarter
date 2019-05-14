//
//  QuestionProvider.swift
//  EnhanceQuizStarter
//
//  Created by hamster1 on 3/5/19.
//  Copyright © 2019 Treehouse. All rights reserved.
//
import GameKit

struct QuestionDataProvider {
    let trivia: [[String : Any]] = [
        ["Question": "Only female koalas can whistle",
         "Answers": ["One", "Two", "Three", "Four"],
         "Answer": "Two"
        ],
        ["Question": "Blue whales are technically whales",
         "Answers": ["One", "Two", "Three", "Four"],
         "Answer": "Three"
        ],
        ["Question": "Camels are cannibalistic",
         "Answers": ["One", "Two", "Three", "Four"],
         "Answer": "Four"
        ],
        ["Question": "All ducks are birds",
         "Answers": ["One", "Two", "Three", "Four"],
         "Answer": "One"
        ]
    ]
    
    var indexOfSelectedQuestion = 0
    
    mutating func randomQuestion() -> [String: Any] {
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count)
        let questionDictionary = trivia[indexOfSelectedQuestion]
        return questionDictionary
    }
    
    func getSelectedIndex() -> Int {
        return indexOfSelectedQuestion
    }
    
    func getSelectedQuestionDict(selectedIndex index:Int) -> [String: Any] {
        return trivia[index]
    }
}
