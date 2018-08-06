//
//  QuestionGroup.swift
//  RabbleWabble
//
//  Created by sato on 2018/08/01.
//  Copyright © 2018年 sato. All rights reserved.
//

public class QuestionGroup: Codable {
    
    public class Score: Codable {
        public var correctCount: Int = 0
        public var incorrectCount: Int = 0
        public init() { }
    }
    
    public let questions: [Question]
    public var score: Score
    public let title: String
    
    public init(questions: [Question], score: Score = Score(), title: String) {
        self.questions = questions
        self.score = score
        self.title = title
    }
}
