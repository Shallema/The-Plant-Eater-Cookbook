//
//  AddRecipeViewController.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 11/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import UIKit
import CoreData

class AddRecipeViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    //MARK:- IBOutlets Properties
    
    @IBOutlet weak var addSegmentedControl: UISegmentedControl!
    
    
    //MARK:- Instance Properties
    
    var savedRecipes = [SavedRecipes]()
    
    var recipe = [String]()
    
    var pageViewController: UIPageViewController!
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let overviewVC = storyboard.instantiateViewController(withIdentifier: "overviewAdd") as! OverviewAddTableViewController
        
        let ingredientsVC = storyboard.instantiateViewController(withIdentifier: "ingredientsAdd") as! IngredientsAddViewController
        
        let descriptionsVC = storyboard.instantiateViewController(withIdentifier: "directionsAdd") as! InstructionsAddViewController
        
        let imageVC = storyboard.instantiateViewController(withIdentifier: "imageAdd") as! ImageAddViewController
        
        return [overviewVC, ingredientsVC, descriptionsVC, imageVC]
    }()
    
    
    //MARK:- Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pageViewController.dataSource = self
        pageViewController.delegate = self
        pageViewController.setViewControllers([orderedViewControllers.first!], direction: .forward, animated: true, completion: nil)
        
        let fetchRequest: NSFetchRequest<SavedRecipes> = SavedRecipes.fetchRequest()
        
        do {
            let savedRecipe = try PersistenceService.context.fetch(fetchRequest)
            self.savedRecipes = savedRecipe
        } catch {}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK:- Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embededPaging" {
            pageViewController = segue.destination as! UIPageViewController
        }
        
        if segue.identifier == "saveUnwind" {
            saveButtonPressed(sender as! UIBarButtonItem)
        }
    }
    
    
    //MARK:- DataSource Protocol
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let next = orderedViewControllers.index(of: viewController)! + 1
        if next < orderedViewControllers.count{
            return orderedViewControllers[next]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let prev = orderedViewControllers.index(of: viewController)! - 1
        if prev >= 0{
            return orderedViewControllers[prev]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed { return}
        if let vc = pageViewController.viewControllers?.first{
            self.addSegmentedControl.selectedSegmentIndex = orderedViewControllers.index(of: vc)!
        }
        
    }
    
    
    //MARK:- IBActions
    
    @IBAction func SwitchViewAction(_ sender: UISegmentedControl) {
        let newIndex = self.addSegmentedControl.selectedSegmentIndex
        if let vc = pageViewController.viewControllers?.first {
            let currentIndex = orderedViewControllers.index(of: vc)!
            pageViewController.setViewControllers([orderedViewControllers[newIndex]], direction: currentIndex < newIndex ? .forward: .reverse, animated: true, completion: nil)
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        
        let newRecipe = SavedRecipes(context: PersistenceService.context)
        
        for vc in orderedViewControllers{
            switch vc {
            case let vc as OverviewAddTableViewController:
                newRecipe.name = vc.overviewContent?.title
                newRecipe.shortDescr = vc.overviewContent?.descr
                newRecipe.source = vc.overviewContent?.source
                newRecipe.nbServe = Int64(vc.overviewContent?.serve ?? 0)
                newRecipe.subcatId = Int64(vc.overviewContent?.category?.id ?? 0)
                newRecipe.prepTime = Double(vc.overviewContent?.prepTime ?? 0 )
                newRecipe.cookTime = Double(vc.overviewContent?.cookTime ?? 0)
                
            case let vc as IngredientsAddViewController:
                newRecipe.ingredients = vc.ingredientContent?.ingredient
                
            case let vc as InstructionsAddViewController:
                newRecipe.fulldescr = vc.instructionContent?.instruction ?? "NO DESCRIPTION"
  
            case let vc as ImageAddViewController:
                if let data = UIImageJPEGRepresentation(vc.imageContent?.image ?? UIImage(), 0.8) {
                    newRecipe.image = data as NSData
                }
      
            default:
                break
            }
        }
        
        PersistenceService.saveContext()
        
        self.dismiss(animated: true)
    }
}
