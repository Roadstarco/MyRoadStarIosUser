//
//  HomeViewController.swift
//  RoadStar Customer
//
//  Created by Roamer on 04/07/2020.
//  Copyright © 2020 Osama Azmat Khan. All rights reserved.
//

import UIKit
import CoreLocation

class HomeViewController: BaseViewController {
    
    
    // MARK: Variables, Constants And Outlets
    
    @IBOutlet weak var localDeliveryView: HomeDeliveryOptionsView!
    @IBOutlet weak var internationalDeliveryView: HomeDeliveryOptionsView!
        
    
    // MARK: Private Functions
    
    override func setupUI() {
        let gestureLocal = UITapGestureRecognizer(target: self, action:  #selector(self.onClickLocalDelivery))
        self.localDeliveryView.addGestureRecognizer(gestureLocal)
        
        let gestureInternational = UITapGestureRecognizer(target: self, action:  #selector(self.onClickInternationalDelivery))
        self.internationalDeliveryView.addGestureRecognizer(gestureInternational)
        
        self.getUserInf()
        
        LocationManager.shared.requestUserPermissionsAndStartUpdatingLocation()
        NotificationCenter.default.addObserver(self, selector: #selector(locationUpdateNotification), name: Notification.Name("UserLocationNotification"), object: nil)
        
    }
    
    @objc func locationUpdateNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo?["location"] as? CLLocation {
            //Store user location
            let userLat = userInfo.coordinate.latitude
            let userLong  = userInfo.coordinate.longitude
            
            var strLat = ""
            var strLong = ""
            if  userLat > 0 {
                strLat = String(userLat)
            }
            if userLong > 0 {
                strLong = String(userLong)
            }
           
        }
    }
    
    func getUserInf()
    {
        let token = UserDefaults.standard.value(forKey: "loginToken") as? String ?? ""
        let profile = ProfileRequest(token: token)
        
        NetworkRepository.shared.userProfileRepository.getUserProfile(with: profile) { (profileResponse, error) in
            
            if let error = error{
                Toast.show(message: "Something went wrong!")
                print("Something went wrong in SIGNUP THE USER. \(error.localizedDescription)")
                
            } else if let userProf = profileResponse {
                
                print(userProf.firstName)
                print(userProf.email)
                
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(userProf) {
                    let defaults = UserDefaults.standard
                    defaults.set(encoded, forKey: "UserProfileInfo")
                    defaults.synchronize()
                }
                
//                let homeNav = UIStoryboard.AppStoryboard.Main.instance.instantiateViewController(withIdentifier: UINavigationController.Identifiers.HomeNav) as! UINavigationController
//                UIApplication.shared.windows.filter {$0.isKeyWindow}.first!.replaceRootViewControllerWith(homeNav, animated: true, completion: nil)
                
            } else{
                Toast.show(message: "Something went wrong!")
                print("Something went wrong in SIGNUP THE USER.")
            }
        }
    }
    
    
    // MARK: Action Functions
    
    @objc func onClickLocalDelivery(_ sender:UITapGestureRecognizer){
        let bookingVC = UIStoryboard.AppStoryboard.Booking.instance.instantiateViewController(withIdentifier: UIViewController.Identifiers.Booking.BookingViewController) as! BookingViewController
        self.navigationController?.pushViewController(bookingVC, animated: true)
    }
    
    @objc func onClickInternationalDelivery(_ sender:UITapGestureRecognizer){
        let bookingVC = UIStoryboard.AppStoryboard.Booking.instance.instantiateViewController(withIdentifier: UIViewController.Identifiers.Booking.BookingViewController) as! BookingViewController
        
        let nav = UINavigationController(rootViewController: bookingVC)
        nav.isNavigationBarHidden = true
        nav.isToolbarHidden = true
        present(nav, animated: true, completion: nil)
//        self.navigationController?.pushViewController(bookingVC, animated: true)
    }
    
    
    
    // MARK: App Flow Functions
    
}
