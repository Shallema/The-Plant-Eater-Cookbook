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

class MySpaceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func handleLogout(_ sender:Any) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
    }
}
