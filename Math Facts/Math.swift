//
//  Math.swift
//  Math Facts
//
//  Created by Jason Myers on 11/20/16.
//  Copyright © 2016 Jason Myers. All rights reserved.
//

import Foundation

class Math {
	
	var firstNumber : Int = 0
	var secondNumber : Int = 0
	var answer : Int = 0
	
	var mathOperator : String = "Default"
	
	var totalCorrect : Int = 0
	var totalQuestions : Int = 0
	
	var buttonRandom : Int = 0
	
	var incorrectAnswer1 : Int = 0
	var incorrectAnswer2 : Int = 0
	var incorrectAnswer3 : Int = 0
	
	func randomizeNumber() {
		var tempFirstNumber = 0
		var tempSecondNumber = 0
		var canDivideEvenly = false
		var bothZero = true
		
		firstNumber = Int(arc4random_uniform(9))
		secondNumber = Int(arc4random_uniform(9))
		
		print("Math Operator: \(mathOperator)")
		
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
	
	

	
}
