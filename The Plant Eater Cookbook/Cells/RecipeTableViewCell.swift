//
//  RecipeTableViewCell.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 10/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    //MARK: - IBOutlets Properties
    @IBOutlet weak var mainContainerView: UIView!
    @IBOutlet weak var recipeListImageView: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!

    //MARK: - Prepare
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.backgroundColor = UIColor.clear
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
