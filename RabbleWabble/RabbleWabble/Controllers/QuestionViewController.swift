//
//  QuestionViewController.swift
//  RabbleWabble
//
//  Created by sato on 2018/08/01.
//  Copyright © 2018年 sato. All rights reserved.
//

import UIKit

// MARK: - QuestionViewControllerDelegate
protocol QuestionViewControllerDelegate {
    func questionViewController(
        _ viewController: QuestionViewController,
        didCancel questionGroup: QuestionGroup,
        at questionIndex: Int)
    
    func questionViewController(
        _ viewCOntroller: QuestionViewController,
        didComplete questionGroup: QuestionGroup
    )
}


class QuestionViewController: UIViewController {
    
    // MARK: - Instance Properties
    public var delegate: QuestionViewControllerDelegate?
    
    public var questionGroup: QuestionGroup! {
        didSet {
            navigationItem.title = questionGroup.title
        }
    }
    public var questionIndex = 0
    
    public var correctCount = 0
    public var incorrectCount = 0
    
    public var questionView: QuestionView! {
        guard isViewLoaded else { return nil }
        return view as! QuestionView
    }
    
    private lazy var questionIndexItem: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        item.tintColor = .black
        navigationItem.rightBarButtonItem = item
        return item
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCancelButton()
        showQuestion()
    }
    
    private func setupCancelButton() {
        let action = #selector(handleCancelPressed(sender:))
        let image = UIImage(named: "ic_menu")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, landscapeImagePhone: nil, style: .plain, target: self, action: action)
    }
    
    @objc private func handleCancelPressed(sender: UIBarButtonItem) {
        delegate?.questionViewController(self, didCancel: questionGroup, at: questionIndex)
    }
    
    private func showQuestion() {
        let question = questionGroup.questions[questionIndex]
        
        questionView.promptLabel.text = question.prompt
        questionView.hintLabel.text = question.hint
        questionView.answerLabel.text = question.answer
        
        questionView.hintLabel.isHidden = true
        questionView.answerLabel.isHidden = true

        questionIndexItem.title = "\(questionIndex + 1)/\(questionGroup.questions.count)"
    }
    
    @IBAction func toggleAnswerLables(_ sender: Any) {
        questionView.hintLabel.isHidden = !questionView.hintLabel.isHidden
        questionView.answerLabel.isHidden = !questionView.answerLabel.isHidden
    }
    
    @IBAction func handleCorrect(_ sender: Any) {
        correctCount += 1
        questionView.correctCountLabel.text = "\(correctCount)"
        showNextQuestion()
    }

    @IBAction func handleIncorrect(_ sender: Any) {
        incorrectCount += 1
        questionView.incorrectCountLabel.text = "\(incorrectCount)"
        showNextQuestion()
    }
    
    private func showNextQuestion() {
        questionIndex += 1
        guard questionIndex < questionGroup.questions.count else {
            delegate?.questionViewController(self, didComplete: questionGroup)
            return
        }
        showQuestion()
    }
}
