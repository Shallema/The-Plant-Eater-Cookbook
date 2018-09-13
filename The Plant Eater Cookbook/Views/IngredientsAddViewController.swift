//
//  IngredientsAddViewController.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 13/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import UIKit

class IngredientsAddViewController: UIViewController {
    
    //MARK: - Instance Properties
    
    struct IngredientContent {
        var ingredient: String?
    }
    
    var ingredientContent: IngredientContent = IngredientContent()
    
    //MARK: - ViewController Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
