//
//  HomeVC.swift
//  Math Facts
//
//  Created by Jason Myers on 10/25/16.
//  Copyright © 2016 Jason Myers. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
	
	@IBOutlet weak var btnAddition: UIButton!
	@IBOutlet weak var btnSubtraction: UIButton!
	@IBOutlet weak var btnMultiplication: UIButton!
	@IBOutlet weak var btnDivision: UIButton!

	
	var mathOperator = ""
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		btnAddition.layer.cornerRadius = 15
		btnSubtraction.layer.cornerRadius = 15
		btnMultiplication.layer.cornerRadius = 15
		btnDivision.layer.cornerRadius = 15
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func btnAdditionACTION(_ sender: UIButton) {
		mathOperator = "+"
	}
	
	@IBAction func btnSubtractionACTION(_ sender: UIButton) {
		mathOperator = "-"
	}
	
	@IBAction func btnMultiplicationACTION(_ sender: UIButton) {
		mathOperator = "x"
	}
	
	@IBAction func btnDivisionACTION(_ sender: UIButton) {
		mathOperator = "÷"
	}
	
		override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
			let DestinationViewController : MathVC = segue.destination as! MathVC
	
			print(mathOperator)
	
			DestinationViewController.mathOperator = mathOperator
		}

}
