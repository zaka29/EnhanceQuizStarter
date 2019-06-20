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
        ["Question": "Only female koalas can whistle?",
         "Answers": ["Yes", "No", "Males, only when eucalyptus drunk", "Only when staring at a male"],
         "Answer": "No",
         "id": 0
        ],
        ["Question": "Blue whales are technically whales?",
         "Answers": ["Yes", "No", "Just whales by day", "Noo, giant fishes"],
         "Answer": "Yes",
         "id": 1
        ],
        ["Question": "Camels are cannibalistic?",
         "Answers": ["Yes", "No", "Only zombie camels", "Camels are vegan"],
         "Answer": "No",
         "id": 2
        ],
        ["Question": "All ducks are birds?",
         "Answers": ["Yes", "No", "Some ducks are birds", "Quack quack"],
         "Answer": "Yes",
         "id": 3
        ],
        ["Question": "Are dogs colour blind?",
         "Answers": ["Yes", "No", "Not all dogs, but some", "Only chihuahuas"],
         "Answer": "No",
         "id": 4
        ],
        ["Question": "Will the alpacas spit at your face if get annoyed?",
         "Answers": ["Yeh, just like lamas", "Nah, never", "Most likely goes for a bite", "Will make clicking noise"],
         "Answer": "Yeh, just like lamas",
         "id": 5
        ],
        ["Question": "Can the pigs swim",
         "Answers": ["Yes", "No, they hate water", "Only bahamas pigs", "Yes, only if forced"],
         "Answer": "Yes",
         "id": 6
        ],
        ["Question": "Why Quokkas are so cute",
         "Answers": ["They always happy", "They live on the island", "They take a lot of selfies", "They living their dreams"],
         "Answer": "They take a lot of selfies",
         "id": 7
        ]
    ]
    
    var indexOfSelectedQuestion = 0
    
    mutating func randomQuestion() -> [String: Any] {
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count)

        return trivia[indexOfSelectedQuestion]
    }
    
    func getSelectedIndex() -> Int {
        return indexOfSelectedQuestion
    }
    
    func getSelectedQuestionDict(selectedIndex index:Int) -> [String: Any] {
        return trivia[index]
    }
}
