//
//  ViewController.swift
//  EnhanceQuizStarter
//
//  Created by Pasan Premaratne on 3/12/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    // MARK: - Properties
    // new question instance here
   
    let questionsPerRound = 4
    var questionsAsked = 0
    var allTriviaQuestions: [Question] = []
    var gameSound: SystemSoundID = 0
    var currentQuestion: Question?
    
    // MARK: - Outlets
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var buttonAnswerFour: UIButton!
    @IBOutlet weak var buttonAnswerThree: UIButton!
    @IBOutlet weak var buttonAnswerTwo: UIButton!
    @IBOutlet weak var buttonAnswerOne: UIButton!
    @IBOutlet weak var buttonNextQuestion: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        playGameStartSound()
        displayQuestion()
    }
    
    // MARK: - Helpers
    
    func loadGameStartSound() {
        let path = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    // to refactor moved to question class
    func displayQuestion() {
        var questionProvider = QuestionDataProvider()
        var questionDictionary = questionProvider.randomQuestion()
        let question = Question(questionText: questionDictionary["Question"]! as! String, questionAnswer: questionDictionary["Answer"]! as! String, allPossibleAnswers: questionDictionary["Answers"] as! [String])
        
        self.allTriviaQuestions.append(question)
        self.currentQuestion = question
        
        questionField.text = question.getText()
        questionField.textColor = UIColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        buttonAnswerOne.setTitle(question.geAnswer(answerNumber: 0), for: UIControl.State.normal)
        buttonAnswerTwo.setTitle(question.geAnswer(answerNumber: 1), for: UIControl.State.normal)
        buttonAnswerThree.setTitle(question.geAnswer(answerNumber: 2), for: UIControl.State.normal)
        buttonAnswerFour.setTitle(question.geAnswer(answerNumber: 3), for: UIControl.State.normal)
        
        playAgainButton.isHidden = true
        buttonNextQuestion.isHidden = true
    }
    
    func displayScore() {
        // Hide the answer uttons
        buttonAnswerOne.isHidden = true
        buttonAnswerTwo.isHidden = true
        buttonAnswerThree.isHidden = true
        buttonAnswerFour.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        buttonNextQuestion.isHidden = true
        
        questionField.text = "Way \(getCorrectQuestitonsPerRound(allQuestions: allTriviaQuestions)) out of \(questionsPerRound) correct!"
        questionField.textColor = UIColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    func loadNextRound(delay seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    func getCorrectQuestitonsPerRound(allQuestions questions: [Question]) -> Int {
        var correctQuestionsCounter: Int = 0
        for question in questions {
            if question.isAnsweredCorrect() {
                correctQuestionsCounter += 1
            }
        }
        return correctQuestionsCounter
    }
   
    // MARK: - Actions
    @IBAction func checkAnswer(_ sender: UIButton) {
        let button = sender as UIButton
        print("test print action: button clicked - \(button.tag)")
        
        currentQuestion?.checkAnswer(buttonPressed: button.tag)

        if currentQuestion?.isAnsweredCorrect() ?? false {
            questionField.text = "Yay correct"
            questionField.textColor = UIColor.init(red: 188/255, green: 244/255, blue: 66/255, alpha: 1.0)
        } else {
            questionField.text = "Nah, maybe next time"
            questionField.textColor = UIColor.init(red: 244/255, green: 104/255, blue: 66/255, alpha: 1.0)
        }
        
        buttonNextQuestion.isHidden = false
    }
    
    @IBAction func goToNextQuestion(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        loadNextRound(delay: 0)
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        // Show the answer buttons
        buttonAnswerOne.isHidden = false
        buttonAnswerTwo.isHidden = false
        buttonAnswerThree.isHidden = false
        buttonAnswerFour.isHidden = false
        
        questionsAsked = 0
        allTriviaQuestions = []
        nextRound()
    }

}

