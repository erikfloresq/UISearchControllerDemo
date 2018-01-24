//
//  ResultTableViewCell.swift
//  UISearchControllerDemo
//
//  Created by Erik Flores on 16/01/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell, ReusableView {

    @IBOutlet weak var resultDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
