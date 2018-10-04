//
//  AppDelegate.swift
//  The Plant Eater Cookbook
//
//  Created by Sandrine ochou on 04/09/2018.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import UIKit
import Firebase
import CoreData

let primaryColor = UIColor(red: 249/255, green: 132/255, blue: 132/255, alpha: 1)
let secondaryColor = UIColor(red: 52/255, green: 230/255, blue: 215/255, alpha: 1)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

        PersistenceService.saveContext()
    }
    

}

