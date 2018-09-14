//
//  OverviewAddTableViewController.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 11/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import UIKit


class OverviewAddTableViewController: UITableViewController {

    //MARK: - IBOutlets Properties
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descrTextField: UITextField!
    
    @IBOutlet weak var selectedCategoryDetailLabel: UILabel!
    
    @IBOutlet weak var sourceTextField: UITextField!
    
    @IBOutlet weak var nbServeLabel: UILabel!
    @IBOutlet weak var nbServeStepper: UIStepper!
    
    @IBOutlet weak var prepTimeLabel: UILabel!
    @IBOutlet weak var prepTimeDatePicker: UIDatePicker!
    @IBOutlet weak var cookTimeLabel: UILabel!
    @IBOutlet weak var cookTimeDatePicker: UIDatePicker!
    
    //MARK: - Instance Properties
    
    struct OverviewContent {
        var title: String = ""
        var descr: String?
        var category: Category?
        var source: String?
        var serve: Int?
        var prepTime: TimeInterval?
        var cookTime: TimeInterval?

    }
    
    var overviewContent: OverviewContent? {
        let title = titleTextField.text ?? ""
        let descr = descrTextField.text ?? ""
        let source = sourceTextField.text ?? ""
        let nbrServe = Int(nbServeStepper.value)
        let prepTime = prepTimeDatePicker.countDownDuration
        let cookTime = cookTimeDatePicker.countDownDuration
        
        return OverviewContent(title: title, descr: descr, category: selectedCategory, source: source, serve: nbrServe, prepTime: prepTime, cookTime: cookTime)
    }

    var selectedCategory: SubCategory? {
        didSet {
            guard let selectedCategory =  selectedCategory else { return }
            selectedCategoryDetailLabel.text = selectedCategory.category.name + " > "  + selectedCategory.name
        }
    }
    
    let prepTimeDatePickerCellIndexPath = IndexPath(row: 2, section: 2)
    let cookTimeDatePickerCellIndexPath = IndexPath(row: 4, section: 2)
    
    var prepTimeDatePickerShown: Bool = false {
        didSet {
            prepTimeDatePicker.isHidden = !prepTimeDatePickerShown
        }
    }
    
    var cookTimeDatePickerShown: Bool = false {
        didSet {
            cookTimeDatePicker.isHidden = !cookTimeDatePickerShown
        }
    }
    
    //MARK: - TableView Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepTimeDatePicker.countDownDuration = 60
        cookTimeDatePicker.countDownDuration = 60
        
        updateCategory()
        updateDateViews()
        updateNumberOfServe()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Instance Functions
    
    func updateCategory() {
        if let selectedCategory = selectedCategory {
            selectedCategoryDetailLabel.text = selectedCategory.name
            
        } else {
            selectedCategoryDetailLabel.text = "..."
        }
    }
    
//    func didSelect(selectedCategory: Category) {
//        self.selectedCategory = selectedCategory
//        updateCategory()
//    }
    
    func updateDateViews() {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .short
        
        prepTimeLabel.text = formatter.string(from: prepTimeDatePicker.countDownDuration)
        cookTimeLabel.text = formatter.string(from: cookTimeDatePicker.countDownDuration)
    }
    
    func updateNumberOfServe() {
        nbServeLabel.text = "\(Int(nbServeStepper.value))"
    }
    
    //MARK: - IBActions
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfServe()
    }
    
    //MARK: - TableView Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row) {
        case (prepTimeDatePickerCellIndexPath.section, prepTimeDatePickerCellIndexPath.row):
            if prepTimeDatePickerShown {
                return 162.0
            } else {
                return 0.0
            }
        case (cookTimeDatePickerCellIndexPath.section, cookTimeDatePickerCellIndexPath.row):
            if cookTimeDatePickerShown {
                return 162.0
            } else {
                return 0.0
            }
        default:
            return 44.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch (indexPath.section, indexPath.row) {
        case (prepTimeDatePickerCellIndexPath.section, prepTimeDatePickerCellIndexPath.row - 1):
            if prepTimeDatePickerShown {
                prepTimeDatePickerShown = false
            } else if cookTimeDatePickerShown {
                cookTimeDatePickerShown = false
                prepTimeDatePickerShown = true
            } else {
                prepTimeDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        case (cookTimeDatePickerCellIndexPath.section, cookTimeDatePickerCellIndexPath.row - 1):
            if cookTimeDatePickerShown {
                cookTimeDatePickerShown = false
            } else if prepTimeDatePickerShown {
                prepTimeDatePickerShown = false
                cookTimeDatePickerShown = true
            } else {
                cookTimeDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        default:
            break
        }
    }
    
    // MARK: - Table view data source

    // MARK: - Navigation
    
    @IBAction func unwindFromSubCategorySelection(unwindSegue: UIStoryboardSegue){
        if let categorySelectionVC = unwindSegue.source as? AddCategoryChoiceTableViewController {
            self.selectedCategory = categorySelectionVC.selectedCat
            print(self.selectedCategory!)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectCategory" {
            let destinationViewController = segue.destination as? AddCategoryChoiceTableViewController
            destinationViewController?.selectedCat = selectedCategory
        }
    }
}
