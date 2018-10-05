//
//  LoginMainViewController.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 14/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import UIKit
import Firebase

class LoginMainViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add the background gradient
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let user = Auth.auth().currentUser {
            self.performSegue(withIdentifier: "toHomeScreen", sender: self)
        }
    }
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        get {
//            return .lightContent
//        }
//    }
    
    @IBAction func unwindLogIn(sender: UIStoryboardSegue) {}
    
}
