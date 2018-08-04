//
//  QuestionStrategy.swift
//  RabbleWabble
//
//  Created by Masahiko Sato on 2018/08/04.
//  Copyright © 2018年 sato. All rights reserved.
//

public protocol QuestionStrategy: class {
    var title: String { get }
    
    var correctCount: Int { get }
    var incorrectCount: Int { get }
    
    func advanceToNextQuestion() -> Bool
    
    func currentQuestion() -> Question
    
    func markQuestionCorrect(_ question: Question)
    func markQuestionIncorrect(_ question: Question)
    
    func questionIndexTitle() -> String
}
