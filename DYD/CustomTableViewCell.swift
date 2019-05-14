//
//  CustomTableViewCell.swift
//  DYD
//
//  Created by apple on 2/17/19.
//  Copyright © 2019 Kiran. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var prayerTextView:UITextView!
    @IBOutlet weak var confessionTextView:UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
