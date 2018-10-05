//
//  ResultRecipesTableViewController.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 10/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import UIKit
import CoreData

class ResultRecipesTableViewController: UITableViewController {
    
    //MARK: - Class Properites
    
    static let recipeDetailsSegue = "toFullRecipe"
    
    //MARK: - Instance Properties
    
    var savedRecipes = [SavedRecipes]()
    
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest: NSFetchRequest<SavedRecipes> = SavedRecipes.fetchRequest()
        
        do {
            let savedRecipe = try PersistenceService.context.fetch(fetchRequest)
            self.savedRecipes = savedRecipe
        } catch {}
        
        //tableView.setEditing(true, animated: true)
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return savedRecipes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listOfSavedRecipes", for: indexPath) as! RecipeTableViewCell
        
        let listRecipes = savedRecipes[indexPath.row]
        cell.update(with: listRecipes)
        cell.showsReorderControl = true
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectRecipe = self.savedRecipes[indexPath.row]
        self.performSegue(withIdentifier: ResultRecipesTableViewController.recipeDetailsSegue, sender: selectRecipe)
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            savedRecipes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.savedRecipes[fromIndexPath.row]
        savedRecipes.remove(at: fromIndexPath.row)
        savedRecipes.insert(movedObject, at: destinationIndexPath.row)
    }

    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailRecipeVC = segue.destination as? RecipeDetailsViewController {
            detailRecipeVC.recipeSaved = sender as? SavedRecipes
        }
    }
}
