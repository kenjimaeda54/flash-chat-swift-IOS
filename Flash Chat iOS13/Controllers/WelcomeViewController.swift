//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit


class WelcomeViewController: UIViewController {
	
	//ciclo de vida
	//https://medium.com/good-morning-swift/ios-view-controller-life-cycle-2a0f02e74ff5
	@IBOutlet weak var titleLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		titleLabel.text = K.appName
		
	}
	
	
}
