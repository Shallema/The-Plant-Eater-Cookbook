//
//  SubCategoriesCollectionViewController.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 10/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cellSubCat"

class SubCategoriesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //MARK: - IBOutlets Properties
    
    @IBOutlet var subCategoriesCollectionView: UICollectionView!
    
    //MARK: - Instance Properties
    
    let catImages: [UIImage] = [
        UIImage(named: "cat1")!,
        UIImage(named: "cat2")!,
        UIImage(named: "cat3")!,
        UIImage(named: "cat4")!,
        UIImage(named: "cat5")!,
        UIImage(named: "cat6")!,
        UIImage(named: "cat7")!,
        UIImage(named: "cat8")!,
        UIImage(named: "cat9")!
    ]
    
    var selectedCategory: Category? {
        didSet {
            guard let selectedCategory = selectedCategory else {
                return
            }
            self.loadViewIfNeeded()
            print(selectedCategory.name)
            let subcategories = SubCategory.getSubcategories(for: selectedCategory)
            for sub in subcategories {
                print(sub.name)
            }
        }
    }
    
    var subcategories: [SubCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subcategories = SubCategory.getSubcategories(for: selectedCategory!)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    

    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return subcategories.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let subcategory = subcategories[indexPath.item]
        let cell = subCategoriesCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SubCategoriesCollectionViewCell
        cell.subCatImageView.image = catImages[indexPath.item]
        cell.subCatLabel.text = subcategory.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        self.subCategoriesCollectionView.layoutIfNeeded()
        let collectionViewWidth = self.subCategoriesCollectionView.bounds.width
        let divideWidth = (collectionViewWidth / 3.0) - 1.0
        return CGSize(width: divideWidth, height: divideWidth)
    }

    // - MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */


    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }


    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
