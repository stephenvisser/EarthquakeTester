//
//  AppDelegate.swift
//  EarthquakeTester
//
//  Created by Stephen Visser on 2016-02-12.
//  Copyright © 2016 Svper. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        
        ViewGenerator(storyboard) { self.window!.rootViewController = $0 }
        
        window?.makeKeyAndVisible()
        return true
    }
}

