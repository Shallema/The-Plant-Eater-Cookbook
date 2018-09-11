//
//  ChoiceCategoryTableViewCell.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 11/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import UIKit

class ChoiceCategoryTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets Properties
    @IBOutlet weak var choiceCatLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
