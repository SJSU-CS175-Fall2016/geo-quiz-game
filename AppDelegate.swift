//
//  AppDelegate.swift
//  GeoQuiz
//
//  Created by Joan sirma on 12/16/16.
//  Copyright © 2016 Joan sirma. All rights reserved.
//

import UIKit
import MapKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var model = Countries()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       // UINavigationBar.appearance().backgroundColor = UIColor.red
        getAnnotations()
        
        
        return true
    }
    
    func getAnnotations()
    {
               let mainBundle = Bundle.main
        let filePath : String? = mainBundle.path(
            forResource: "countriesList", ofType: ".txt")
        do {
            let theBigString: String? = try String(contentsOfFile: filePath!, encoding: String.Encoding.utf8)
            
            let countries = theBigString?.components(separatedBy: "#")
            for country in countries!{
                let trimmed = country.replacingOccurrences(of: "\n", with: "")
                let part = trimmed.components(separatedBy: ",")
                let locationCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: Double(part[2])!, longitude: Double(part[3])!)
                let l: Location = Location(country: part[0], capital: part[1],coordinate: locationCoordinate)
                model.listOfCountries.append(l)
            }
        } catch{
            print("No Such File in Directory")
        }
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

