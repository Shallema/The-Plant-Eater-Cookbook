//
//  MainViewController.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 5/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    //let categories = ["Cat1", "Cat2", "Cat3", "Cat4", "Cat5", "Cat6", "Cat7", "Cat8", "Cat9"]
    
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
    
    let categories: [Category] = [
        Category(id: 1, name: "Starter", image: "", subcategories: []),
        Category(id: 2, name: "Main", image: "", subcategories: []),
        Category(id: 3, name: "Sweet", image: "", subcategories: []),
        Category(id: 4, name: "Drink", image: "", subcategories: []),
        Category(id: 5, name: "Snack", image: "", subcategories: []),
        Category(id: 6, name: "All", image: "", subcategories: [])
    ]
    
    let subCategories: [SubCategory] = [
        SubCategory(id: 1, name: "JunkFood", image: ""),
        SubCategory(id: 2, name: "Indian", image: ""),
        SubCategory(id: 3, name: "Lebanese", image: ""),
        SubCategory(id: 4, name: "Asian", image: ""),
        SubCategory(id: 5, name: "Burger", image: ""),
        SubCategory(id: 6, name: "Pasta", image: ""),
        SubCategory(id: 7, name: "Biscuits", image: ""),
        SubCategory(id: 8, name: "Pies", image: ""),
        SubCategory(id: 9, name: "Salty", image: ""),
        SubCategory(id: 10, name: "Sweet", image: ""),
        SubCategory(id: 11, name: "All", image: "")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category = categories[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellCat", for: indexPath) as! CategoriesCollectionViewCell
        cell.categorieImageView.image = catImages[indexPath.item]
        cell.categorieLabel.text = category.name
        
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
        self.categoriesCollectionView.layoutIfNeeded()
        let collectionViewWidth = self.categoriesCollectionView.bounds.width
        let divideWidth = (collectionViewWidth / 3.0) - 1.0
        return CGSize(width: divideWidth, height: divideWidth)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        if segue.identifier == "exitSearch" {
            categoriesCollectionView.reloadData()
        }
    }
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        if segue.identifier == "exitAdd" {
            categoriesCollectionView.reloadData()
        }
    }

}
