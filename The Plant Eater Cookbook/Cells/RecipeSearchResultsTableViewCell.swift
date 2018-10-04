//
//  RecipeSearchResultsTableViewCell.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 28/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import UIKit
import AlamofireImage

class RecipeSearchResultsTableViewCell: UITableViewCell {

    @IBOutlet weak var mainContainerView: UIView!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeInfoLabel: UILabel!
    
    var recipe: EdamamRecipe?{
        didSet{
            guard let recipe = recipe else {
                return
            }
            if let imgUrl =  URL(string: recipe.image) {
                 self.recipeImageView.af_setImage(withURL: imgUrl, placeholderImage: UIImage(named: "cat3")!)
            }
           
            self.recipeNameLabel.text = recipe.label
            self.recipeInfoLabel.text = recipe.url
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.backgroundColor = UIColor.clear
        self.contentView.layer.masksToBounds = false
        self.contentView.layer.shadowColor = UIColor.lightGray.cgColor
        self.contentView.layer.shadowOpacity = 0.7
        self.contentView.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        self.mainContainerView.layer.masksToBounds = true
        self.mainContainerView.layer.cornerRadius = 4.0
        self.mainContainerView.layer.borderColor = UIColor.lightGray.cgColor
        self.mainContainerView.layer.borderWidth = 0.5
        
        self.selectionStyle = .none
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        UIView.animate(withDuration: 0.5) {
            self.mainContainerView.backgroundColor = selected ? UIColor.lightGray : UIColor.white
            self.contentView.layer.shadowOpacity = selected ? 0.0 : 0.7
            self.recipeNameLabel.textColor = selected ? UIColor.white : UIColor.black
            self.recipeInfoLabel.textColor = selected ? UIColor.white : UIColor.black
        }
        
    }
    
    
    
}

