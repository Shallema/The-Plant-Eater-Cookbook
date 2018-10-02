//
//  QuickAddViewController.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 2/10/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import UIKit
import CoreData

class QuickAddViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var quickRecipe = [QuickAdd]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest: NSFetchRequest<QuickAdd> = QuickAdd.fetchRequest()
        
        do {
            let quickRecipe = try PersistenceService.context.fetch(fetchRequest)
            self.quickRecipe = quickRecipe
            self.tableView.reloadData()
        } catch {}
        
    }
    
    @IBAction func onPlusTapped() {
        let alert = UIAlertController(title: "Add a Recipe", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Title"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Category"
        }
        let action = UIAlertAction(title: "Post", style: .default) { (_) in
            let title = alert.textFields!.first!.text!
            let categ = alert.textFields!.last!.text!
            let quickRecipes = QuickAdd(context: PersistenceService.context)
            quickRecipes.name = title
            quickRecipes.category = categ
            PersistenceService.saveContext()
            self.quickRecipe.append(quickRecipes)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

extension QuickAddViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quickRecipe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = quickRecipe[indexPath.row].name
        cell.detailTextLabel?.text = quickRecipe[indexPath.row].category
        return cell
    }
}
