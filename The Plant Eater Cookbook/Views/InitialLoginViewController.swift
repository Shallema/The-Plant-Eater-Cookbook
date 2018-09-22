//
//  InitialLoginViewController.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 22/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import Foundation
import UIKit

class InitialLoginViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //- Todo: Check if user is authenticated. If so, segue to the HomeViewController, otherwise, segue to the MenuViewController
        
        self.performSegue(withIdentifier: "toMenuScreen", sender: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
}
