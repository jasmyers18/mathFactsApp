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

	var firstNumber : Int = 0
	var secondNumber : Int = 0
	var answer : Int = 0
	
	var mathOperator = String()
	
	var totalCorrect : Int = 0
	var correctIncorrect = ""
	var totalQuestions : Int = 0
	
	var buttonRandom : Int = 0
	
	var incorrectAnswer1 : Int = 0
	var incorrectAnswer2 : Int = 0
	var incorrectAnswer3 : Int = 0
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		btnAnswer1.layer.cornerRadius = 15
		btnAnswer2.layer.cornerRadius = 15
		btnAnswer3.layer.cornerRadius = 15
		btnAnswer4.layer.cornerRadius = 15
		
		randomizeNumber()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	@IBAction func btnAnswer1ACTION(_ sender: UIButton) {
		if buttonRandom == 0 {
			button1Correct()
		} else if (buttonRandom != 0) {
			incorrectAnswerVOID()
		}
	}
	
	@IBAction func btnAnswer2ACTION(_ sender: UIButton) {
		if buttonRandom == 1 {
			button2Correct()
		} else if (buttonRandom != 1) {
			incorrectAnswerVOID()
		}
	}
	
	@IBAction func btnAnswer3ACTION(_ sender: UIButton) {
		if buttonRandom == 2 {
			button3Correct()
		} else if (buttonRandom != 2) {
			incorrectAnswerVOID()
		}
	}
	
	@IBAction func btnAnswer4ACTION(_ sender: UIButton) {
		if buttonRandom == 3 {
			button4Correct()
		} else if (buttonRandom != 3) {
			incorrectAnswerVOID()
		}
	}
	
	@IBAction func btnBackACTION(_ sender: UIBarButtonItem) {
		mathOperator = ""
		totalCorrect = 0
	}
	
	func randomizeNumber() {
		var tempFirstNumber = 0
		var tempSecondNumber = 0
		var canDivideEvenly = false
		var bothZero = true
		
		firstNumber = Int(arc4random_uniform(9))
		secondNumber = Int(arc4random_uniform(9))
		
		switch mathOperator {
		case "+":
			answer = firstNumber + secondNumber
		case "-":
			if secondNumber > firstNumber {
				tempFirstNumber = firstNumber
				tempSecondNumber = secondNumber
				
				firstNumber = tempSecondNumber
				secondNumber = tempFirstNumber
			}
			
			answer = firstNumber - secondNumber
		case "x":
			answer = firstNumber * secondNumber
		case "÷":
			while bothZero {
				if firstNumber == 0 || secondNumber == 0 {
					
					firstNumber = Int(arc4random_uniform(20))
					secondNumber = Int(arc4random_uniform(20))
					
				} else {
					bothZero = false
				}
			}
			
			bothZero = true
			
			while !canDivideEvenly {
				
				if secondNumber > firstNumber {
					tempFirstNumber = firstNumber
					tempSecondNumber = secondNumber
					
					firstNumber = tempSecondNumber
					secondNumber = tempFirstNumber
				}
				
				if firstNumber % secondNumber != 0 {
					firstNumber += 1
					
				} else {
					canDivideEvenly = true
				}
			}
			
			canDivideEvenly = false
			
			answer = firstNumber / secondNumber
		default:
			print("Couldn't find the operator")
		}
		
		
		buttonRandom = Int(arc4random_uniform(4))
		
		incorrectAnswer1 = Int(arc4random_uniform(5))
		incorrectAnswer2 = Int(arc4random_uniform(2))
		incorrectAnswer3 = Int(arc4random_uniform(9))
		
		randomNumberChecks()
		
		printQuestion()
		printButtonText()
		
		print(answer)
	}
	
	func printQuestion() {
		lblProblem.text = "\(firstNumber) \(mathOperator) \(secondNumber) = ?"
	}
	
	func randomNumberChecks() {
		
		while answer == incorrectAnswer1 || answer == incorrectAnswer2 || answer == incorrectAnswer3 || incorrectAnswer1 == incorrectAnswer2 || incorrectAnswer1 == incorrectAnswer3 || incorrectAnswer2 == incorrectAnswer3 {
			
			checkAnswerValues()
			checkIncorrectAnswerValues()
		}
	}
	
	func checkAnswerValues() {
		if answer == incorrectAnswer1 || answer == incorrectAnswer2 || answer == incorrectAnswer3 {
			
			if answer == incorrectAnswer1 {
				incorrectAnswer1 += 2
				
			}
			
			if answer == incorrectAnswer2 {
				incorrectAnswer2 += 4
				
			}
			
			if answer == incorrectAnswer3 {
				incorrectAnswer3 += 6
			}
		}
	}
	
	func checkIncorrectAnswerValues() {
		if incorrectAnswer1 == incorrectAnswer2 || incorrectAnswer1 == incorrectAnswer3 || incorrectAnswer2 == incorrectAnswer3 {
			
			if incorrectAnswer1 == incorrectAnswer2 {
				incorrectAnswer2 += 3
			}
			
			if incorrectAnswer1 == incorrectAnswer3 {
				incorrectAnswer1 += 5
			}
			
			if incorrectAnswer2 == incorrectAnswer3 {
				incorrectAnswer3 += 7
			}
		}
	}
	
	func printButtonText() {
		
		if buttonRandom == 0 {
			btnAnswer1.setTitle("\(answer)", for: UIControlState.normal)
			btnAnswer2.setTitle("\(incorrectAnswer1)", for: UIControlState.normal)
			btnAnswer3.setTitle("\(incorrectAnswer2)", for: UIControlState.normal)
			btnAnswer4.setTitle("\(incorrectAnswer3)", for: UIControlState.normal)
		}
		
		if buttonRandom == 1 {
			btnAnswer2.setTitle("\(answer)", for: UIControlState.normal)
			btnAnswer1.setTitle("\(incorrectAnswer1)", for: UIControlState.normal)
			btnAnswer3.setTitle("\(incorrectAnswer2)", for: UIControlState.normal)
			btnAnswer4.setTitle("\(incorrectAnswer3)", for: UIControlState.normal)
		}
		
		if buttonRandom == 2 {
			btnAnswer3.setTitle("\(answer)", for: UIControlState.normal)
			btnAnswer1.setTitle("\(incorrectAnswer1)", for: UIControlState.normal)
			btnAnswer2.setTitle("\(incorrectAnswer2)", for: UIControlState.normal)
			btnAnswer4.setTitle("\(incorrectAnswer3)", for: UIControlState.normal)
		}
		
		if buttonRandom == 3 {
			btnAnswer4.setTitle("\(answer)", for: UIControlState.normal)
			btnAnswer3.setTitle("\(incorrectAnswer1)", for: UIControlState.normal)
			btnAnswer2.setTitle("\(incorrectAnswer2)", for: UIControlState.normal)
			btnAnswer1.setTitle("\(incorrectAnswer3)", for: UIControlState.normal)
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
		totalCorrect += 1
		totalQuestions += 1
		correctIncorrect = "Correct"
	}
	
	func incorrectAnswerVOID() {
		correctIncorrect = "Incorrect"
		printCorrectIncorrect()
		totalQuestions += 1
	}
	
	func printCorrectIncorrect() {
		lblTotalCorrect.text = "Total Correct: \(totalCorrect) / \(totalQuestions)"
//		lblCorrectIncorrect.text = "\(correctIncorrect)"
//		
		reset()
	}
	
	func reset() {
		randomizeNumber()
	}
	
	func resetButton() {
		totalCorrect = 0
//		lblTotalCorrect.text = "Total correct: \(totalCorrect)"
//		lblCorrectIncorrect.text = "Correct / Incorrect"
	
		randomizeNumber()
	}
	

	@IBAction func backBtnPressed(_ sender: UIButton) {
		
		dismiss(animated: true, completion: nil)
	}
}

