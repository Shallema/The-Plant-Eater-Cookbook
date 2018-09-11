//
//  MainViewController.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 5/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - IBOutlets Properties
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
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
            categories = SubCategory.getSubcategories(for: selectedCategory)
        }
    }
    
    var categories = Category.fetchAllCategories()
    
    //MARK: - ViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UICollectionView DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category: Category = categories[indexPath.item]
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let subcategory = categories[indexPath.item] as? SubCategory {
            self.performSegue(withIdentifier: "displayRecipes", sender: subcategory)
        } else {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewControllerID") as! MainViewController
            vc.selectedCategory = categories[indexPath.item]
            self.navigationController?.pushViewController(vc, animated: true)
        }
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
