//
//  QuestionGroupCaretaker.swift
//  RabbleWabble
//
//  Created by Masahiko Sato on 2018/08/06.
//  Copyright © 2018年 sato. All rights reserved.
//

import Foundation

public final class QuestionGroupCaretaker {
    
    // MARK: - Properties
    private let fileName = "QuestionGroupData"
    public var questionGroups: [QuestionGroup] = []
    public var selectedQuestionGroup: QuestionGroup!
    
    // MARK: - Object Lifecycle
    public init() {
        loadQuestionGroups()
    }
    
    private func loadQuestionGroups() {
        if let questionGroups = try? DiskCaretaker.retrieve([QuestionGroup].self, from: fileName) {
            self.questionGroups = questionGroups
        } else {
            let bundle = Bundle.main
            let url = bundle.url(forResource: fileName, withExtension: "json")!
            self.questionGroups = try! DiskCaretaker.retrieve([QuestionGroup].self, from: url)
            try! save()
        }
    }
    
    // MARK: - Instance Methods
    public func save() throws {
        try DiskCaretaker.save(questionGroups, to: fileName)
    }
}
