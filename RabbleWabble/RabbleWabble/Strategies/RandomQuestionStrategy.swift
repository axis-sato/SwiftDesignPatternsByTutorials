//
//  RandomQuestionStrategy.swift
//  RabbleWabble
//
//  Created by Masahiko Sato on 2018/08/04.
//  Copyright © 2018年 sato. All rights reserved.
//

import GameplayKit.GKRandomSource

public class RandomQuestionStrategy: BaseQuestionStrategy {
    public convenience init(questionGroupCaretaker: QuestionGroupCaretaker) {
        let questionGroup = questionGroupCaretaker.selectedQuestionGroup!
        let randomSource = GKRandomSource.sharedRandom()
        let questions = randomSource.arrayByShufflingObjects(in: questionGroup.questions) as! [Question]
        
        self.init(questionGroupCaretaker: questionGroupCaretaker, questions: questions)
    }
}
