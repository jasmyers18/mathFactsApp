//
//  MathVC.swift
//  Math Facts
//
//  Created by Jason Myers on 10/22/16.
//  Copyright © 2016 Jason Myers. All rights reserved.
//

import UIKit

class MathVC: UIViewController {

    @IBOutlet weak var lblProblem: UILabel!
	@IBOutlet weak var btnAnswer1: UIButton!
	@IBOutlet weak var btnAnswer2: UIButton!
	@IBOutlet weak var btnAnswer3: UIButton!
	@IBOutlet weak var btnAnswer4: UIButton!
	@IBOutlet weak var lblTotalCorrect: UILabel!
	
	let mth = Math()
	var mathOperator = ""
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		btnAnswer1.layer.cornerRadius = 15
		btnAnswer2.layer.cornerRadius = 15
		btnAnswer3.layer.cornerRadius = 15
		btnAnswer4.layer.cornerRadius = 15

		mth.mathOperator = mathOperator
		mth.randomizeNumber()
		printQuestion()
		printButtonText()
    }

	@IBAction func btnAnswer1ACTION(_ sender: UIButton) {
		if mth.buttonRandom == 0 {
			button1Correct()
		} else if (mth.buttonRandom != 0) {
			incorrectAnswer()
		}
	}
	
	@IBAction func btnAnswer2ACTION(_ sender: UIButton) {
		if mth.buttonRandom == 1 {
			button2Correct()
		} else if (mth.buttonRandom != 1) {
			incorrectAnswer()
		}
	}
	
	@IBAction func btnAnswer3ACTION(_ sender: UIButton) {
		if mth.buttonRandom == 2 {
			button3Correct()
		} else if (mth.buttonRandom != 2) {
			incorrectAnswer()
		}
	}
	
	@IBAction func btnAnswer4ACTION(_ sender: UIButton) {
		if mth.buttonRandom == 3 {
			button4Correct()
		} else if (mth.buttonRandom != 3) {
			incorrectAnswer()
		}
	}
	
	func printQuestion() {
		lblProblem.text = "\(mth.firstNumber) \(mth.mathOperator) \(mth.secondNumber) = ?"
	}
	
	func printButtonText() {
		print(mth.buttonRandom)
		
		if mth.buttonRandom == 0 {
			btnAnswer1.setTitle("\(mth.answer)", for: UIControlState.normal)
			btnAnswer2.setTitle("\(mth.incorrectAnswer1)", for: UIControlState.normal)
			btnAnswer3.setTitle("\(mth.incorrectAnswer2)", for: UIControlState.normal)
			btnAnswer4.setTitle("\(mth.incorrectAnswer3)", for: UIControlState.normal)
		}
		
		if mth.buttonRandom == 1 {
			btnAnswer2.setTitle("\(mth.answer)", for: UIControlState.normal)
			btnAnswer1.setTitle("\(mth.incorrectAnswer1)", for: UIControlState.normal)
			btnAnswer3.setTitle("\(mth.incorrectAnswer2)", for: UIControlState.normal)
			btnAnswer4.setTitle("\(mth.incorrectAnswer3)", for: UIControlState.normal)
		}
		
		if mth.buttonRandom == 2 {
			btnAnswer3.setTitle("\(mth.answer)", for: UIControlState.normal)
			btnAnswer1.setTitle("\(mth.incorrectAnswer1)", for: UIControlState.normal)
			btnAnswer2.setTitle("\(mth.incorrectAnswer2)", for: UIControlState.normal)
			btnAnswer4.setTitle("\(mth.incorrectAnswer3)", for: UIControlState.normal)
		}
		
		if mth.buttonRandom == 3 {
			btnAnswer4.setTitle("\(mth.answer)", for: UIControlState.normal)
			btnAnswer3.setTitle("\(mth.incorrectAnswer1)", for: UIControlState.normal)
			btnAnswer2.setTitle("\(mth.incorrectAnswer2)", for: UIControlState.normal)
			btnAnswer1.setTitle("\(mth.incorrectAnswer3)", for: UIControlState.normal)
		}
	}
	
	func button1Correct() {
		correctLogic()
		printCorrectIncorrect()
	}
	
	func button2Correct() {
		correctLogic()
		printCorrectIncorrect()
	}
	
	func button3Correct() {
		correctLogic()
		printCorrectIncorrect()
	}
	
	func button4Correct() {
		correctLogic()
		printCorrectIncorrect()
	}
	
	func correctLogic() {
		mth.totalCorrect += 1
		mth.totalQuestions += 1
	}
	
	func incorrectAnswer() {
		mth.totalQuestions += 1
		printCorrectIncorrect()
	}
	
	func printCorrectIncorrect() {
		lblTotalCorrect.text = "Total Correct: \(mth.totalCorrect) / \(mth.totalQuestions)"

		mth.randomizeNumber()
		printQuestion()
		printButtonText()
	}
	
	@IBAction func resetBtnPressed(_ sender: UIButton) {
		mth.totalCorrect = 0
		mth.totalQuestions = 0
		lblTotalCorrect.text = "Total correct: 0 / \(mth.totalCorrect)"
		
		mth.randomizeNumber()
		printQuestion()
		printButtonText()
	}

	@IBAction func backBtnPressed(_ sender: UIButton) {
		
		dismiss(animated: true, completion: nil)
	}
}

