//
//  AppDelegate.swift
//  RoadStar Customer
//
//  Created by Roamer on 04/07/2020.
//  Copyright © 2020 Osama Azmat Khan. All rights reserved.
//

import UIKit
import SideMenu
import GoogleMaps
import Firebase
import Stripe

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        App.shared.initialize(application)
        FirebaseApp.configure()
        STPAPIClient.shared.publishableKey = "pk_test_51HeDaeHV7Xodq4BS6RlcHrqGwXVVQZNgTcZPUn3T3lQdxr7jbGFQ72lx8ZcpAhiLZCmnghkuTTrI9u0dLdhnPgo600rrYtZzSS"
        
//        GMSServices.provideAPIKey("AIzaSyA5l_TkMB4GUvCJx_lNcgz23CjFjdYwmc8")//Old one
        GMSServices.provideAPIKey("AIzaSyCO--TQ_iF9WC2_Gv7KgjasEmnEoxwbF-E")//New one

        //AIzaSyCO--TQ_iF9WC2_Gv7KgjasEmnEoxwbF-E
        
        return true
    }
    
    func setRootController(controller: UIViewController){
        window = window ?? UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = controller
        window!.makeKeyAndVisible()
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

