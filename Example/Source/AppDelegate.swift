//
//  AppDelegate.swift
//  Example
//
//  Created by Red Davis on 11/06/2019.
//  Copyright © 2019 Plum Fintech Limited. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    // Internal
    internal var window: UIWindow?
    
    // Private
    private var rootViewController: RootViewController!
    
    // MARK: UIApplicationDelegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        // Root view controller
        self.rootViewController = RootViewController()
        
        // Window
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = self.rootViewController
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication)
    {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication)
    {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication)
    {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication)
    {
        
    }

    func applicationWillTerminate(_ application: UIApplication)
    {
        
    }
}
