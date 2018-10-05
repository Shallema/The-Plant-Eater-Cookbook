//
//  RecipeDetailsViewController.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 10/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import UIKit
import CoreData

class RecipeDetailsViewController: UIViewController {
    
    //MARK: - Instance Properties
    
    var savedRecipes = [SavedRecipes]()
    
    
    
    var recipeSaved: SavedRecipes? {
        didSet {
            guard let saved = recipeSaved else { return }
            self.loadViewIfNeeded()
            self.navigationItem.title = saved.name
            //self.titleLabel.text = saved.name
            imageRecipeImageView.image = UIImage(data: saved.image as! Data)
            self.sourceLabel.text = saved.source
            self.nbServingLabel.text = "\(saved.nbServe)"
            self.prepTimeLabel.text = "\(saved.prepTime)"
            self.cookTimeLabel.text = "\(saved.cookTime)"
            ingredientsTextView.text = saved.ingredients
            descriptionTextView.text = saved.fulldescr

        }
    }
    
    //MARK: - IBOutlets
    
    //@IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var imageRecipeImageView: UIImageView!
    
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var nbServingLabel: UILabel!
    @IBOutlet weak var prepTimeLabel: UILabel!
    @IBOutlet weak var cookTimeLabel: UILabel!
    
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let fetchRequest: NSFetchRequest<SavedRecipes> = SavedRecipes.fetchRequest()
        
        do {
            let savedRecipe = try PersistenceService.context.fetch(fetchRequest)
            self.savedRecipes = savedRecipe
        } catch {}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
