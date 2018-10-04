//
//  InstructionsAddViewController.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 13/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import UIKit
import CoreData

class InstructionsAddViewController: UIViewController, UITextViewDelegate {
    
    //MARK: - IBOutlet Properties
    
    @IBOutlet weak var instructionsTextView: UITextView!
    
    //MARK: - Instance Properties
    
    struct InstructionsContent {
        var instruction: String?
    }
    
    var instructionContent: InstructionsContent? {
        self.loadViewIfNeeded()
        let instructions = instructionsTextView.text ?? ""
        
        return InstructionsContent(instruction: instructions)
    }
    
    //MARK: - ViewController Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        instructionsTextView.delegate = self
        
        instructionsTextView.text = "Add instructions..."
        instructionsTextView.textColor = UIColor.lightGray
        textViewDidBeginEditing(instructionsTextView)
        textViewDidEndEditing(instructionsTextView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Functions
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if instructionsTextView.textColor == UIColor.lightGray {
            instructionsTextView.text = nil
            instructionsTextView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if instructionsTextView.text.isEmpty {
            instructionsTextView.text = "Add instructions..."
            instructionsTextView.textColor = UIColor.lightGray
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
