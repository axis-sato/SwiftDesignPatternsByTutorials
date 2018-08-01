//
//  QuestionView.swift
//  RabbleWabble
//
//  Created by sato on 2018/08/01.
//  Copyright © 2018年 sato. All rights reserved.
//

import UIKit

public class QuestionView: UIView {
    @IBOutlet weak var promptLabel: UILabel!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var correctCountLabel: UILabel!
    @IBOutlet weak var incorrectCountLabel: UILabel!
}
