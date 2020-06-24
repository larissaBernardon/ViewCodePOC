//
//  AppDelegate.swift
//  ViewCodePOC
//
//  Created by Tag Livros on 21/06/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let controller = ViewController()
        window.rootViewController = controller
        
        self.window = window
        window.makeKeyAndVisible()
        
        return true
    }
}

