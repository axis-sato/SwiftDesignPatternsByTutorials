//
//  Question.swift
//  RabbleWabble
//
//  Created by sato on 2018/08/01.
//  Copyright © 2018年 sato. All rights reserved.
//

public class Question: Codable {
    public let answer: String
    public let hint: String?
    public let prompt: String
    
    init(answer: String, hint: String?, prompt: String) {
        self.answer = answer
        self.hint = hint
        self.prompt = prompt
    }
}
