//
//  LabelTableViewCell.swift
//  CollectionViewInTableViewCell
//
//  Created by Pankaj Kulkarni on 15/06/18.
//  Copyright © 2018 Pankaj Kulkarni. All rights reserved.
//

import UIKit

class LabelTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
