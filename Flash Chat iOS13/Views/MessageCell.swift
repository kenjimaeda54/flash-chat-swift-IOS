//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by kenjimaeda on 11/07/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
	
	@IBOutlet weak var labelCell: UILabel!
	@IBOutlet weak var messageBubble: UIView!
	@IBOutlet weak var LeftImage: UIImageView!
	
	@IBOutlet weak var RightImage: UIImageView!
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
		//maneira de fazer corner radius dinamico
		//com frame pega altura da view
		messageBubble.layer.cornerRadius = messageBubble.frame.height / 5
	}
	
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
}
