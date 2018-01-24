//
//  VerbTableViewCell.swift
//  UISearchControllerDemo
//
//  Created by Erik Flores on 16/01/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import UIKit

class VerbTableViewCell: UITableViewCell, ReusableView {

    @IBOutlet weak var baseForm: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
