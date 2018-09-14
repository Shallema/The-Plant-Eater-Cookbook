//
//  IngredientsAddViewController.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 13/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import UIKit

class IngredientsAddViewController: UIViewController, UITextViewDelegate {
    
    //MARK: - IBOutlets Properties
    
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    
    //MARK: - Instance Properties
    
    struct IngredientContent {
        var ingredient: String?
    }
    
    var ingredientContent: IngredientContent? {
        let ingredient = ingredientsTextView.text ?? ""
        return IngredientContent(ingredient: ingredient)
    }
    
    //MARK: - ViewController Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientsTextView.delegate = self
        
        ingredientsTextView.text = "Add ingredients..."
        ingredientsTextView.textColor = UIColor.lightGray
        textViewDidBeginEditing(ingredientsTextView)
        textViewDidEndEditing(ingredientsTextView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Functions
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if ingredientsTextView.textColor == UIColor.lightGray {
            ingredientsTextView.text = nil
            ingredientsTextView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if ingredientsTextView.text.isEmpty {
            ingredientsTextView.text = "Add ingredients..."
            ingredientsTextView.textColor = UIColor.lightGray
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
