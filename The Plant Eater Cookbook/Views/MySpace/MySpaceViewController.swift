//
//  MySpaceViewController.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 22/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import AlamofireImage

class MySpaceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    //MARK:- Class Properties
    static let recipeDetailsSegue = "RecipeDetails"
    
    
    //MARK:- Instance Properties
    var recipeResults: [EdamamRecipe]?
    var lastSearchTerm: String = ""
    var timer: Timer?
    
    
    //MARK:- IBOutlets properties
    @IBOutlet weak var recipeApiSearchBar: UISearchBar!
    @IBOutlet weak var recipeResultsTableView: UITableView!
    
    
    //MARK:- ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.recipeResultsTableView.contentInset = UIEdgeInsets(top: 56, left: 0, bottom: 0, right: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    //MARK:- TableView Datasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipeResults?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.recipeResultsTableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! RecipeSearchResultsTableViewCell
        cell.recipe = self.recipeResults![indexPath.row]
        return cell
    }
    
    
    //MARK:- TableView Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.fadeIn(delay: 0.25)
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let recipe = self.recipeResults![indexPath.row]
//        self.performSegue(withIdentifier: MySpaceViewController.recipeDetailsSegue , sender: recipe)
//    }
    
    
    //MARK:- SearchBar Delegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("search is \(searchText)")
        
        self.timer?.invalidate()
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.launchSearch(withTerm: searchText)
        })
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        self.launchSearch(withTerm: searchBar.text ?? "")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
    func launchSearch(withTerm term: String) {
        
        guard !term.isEmpty && self.lastSearchTerm != term else {
            return
        }
        
        EdamamAPIController.shared.search(withQuery: term) { (searchResults) in
            
            if searchResults.isEmpty{
                let alert = UIAlertController(title: "Not Found", message: "Your request for '\(term)' did not match any results", preferredStyle: .alert)
                let dismiss = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel)
                alert.addAction(dismiss)
                self.present(alert, animated: true)
            }
            
            self.recipeResults = searchResults
            self.recipeResultsTableView.reloadData()
            self.lastSearchTerm = term
        }
    }

    //MARK:- IBActions
    
    @IBAction func handleLogout(_ sender:Any) {
        try! Auth.auth().signOut()
        self.navigationController?.popViewController(animated: true)
        let alert = UIAlertController(title: "Hourray", message: "You're successfully logged out !", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel)
        alert.addAction(dismiss)
        self.present(alert, animated: true)
    }
}
