//
//  SequentialQuestionStrategy.swift
//  RabbleWabble
//
//  Created by Masahiko Sato on 2018/08/04.
//  Copyright © 2018年 sato. All rights reserved.
//

public class SequentialQuestionStrategy: BaseQuestionStrategy {
    public convenience init(questionGroupCaretaker: QuestionGroupCaretaker) {
        let questionGroup = questionGroupCaretaker.selectedQuestionGroup!
        let questions = questionGroup.questions
        self.init(questionGroupCaretaker: questionGroupCaretaker, questions: questions)
    }
}
