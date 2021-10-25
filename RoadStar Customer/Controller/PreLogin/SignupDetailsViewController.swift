//
//  SignupDetailsViewController.swift
//  RoadStar Customer
//
//  Created by Roamer on 11/07/2020.
//  Copyright © 2020 Osama Azmat Khan. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class SignupDetailsViewController: BaseViewController {

    @IBOutlet weak var txtPassword: SkyFloatingLabelTextField!
    @IBOutlet weak var txtAddress: SkyFloatingLabelTextField!
    @IBOutlet weak var txtEmail: SkyFloatingLabelTextField!
    @IBOutlet weak var txtLastName: SkyFloatingLabelTextField!
    @IBOutlet weak var txtFirstName: SkyFloatingLabelTextField!
    
    var phoneNumber: String!
    
    override func setupUI() {
        print(phoneNumber)
    }
    
    override func setupTheme() {
        super.setupTheme()
        
    }
    
    @IBAction func onCLickNextBtn(_ sender: Any) {
        
        if isValidData(){
            
            let signUp = SignUp(login_by: "manual", first_name: txtFirstName.text!, last_name: txtLastName.text!, mobile: phoneNumber, social_unique_id: "", email: txtEmail.text!, grant_type: "password", client_secret: "WX2IZR5Yi6gpZ3ajSJ4meKik3R0K1z2vomJVc2Qw", client_id: "2", password: txtPassword.text!, device_type: "ios", device_id: "d7efe9cadf4f483e", device_token: "fRfI-VPhQcy_oD93FQdnrp:APA91bERv1cOgZBghbd0orQu1snCMBHA00ntwWfVYOJyyT4ADSSAlZVrttaixMDL_ocWCvIz6-pQuIdLM-VRVCUMZ9vUfpvAXqzw1IfZlF1VFWhw1Prc34979L2dAKJ1VU6uGNjRroPo", country_name: "Pakistan", address: txtAddress.text!)
            
            NetworkRepository.shared.signUpRepository.signUp(with: signUp) { (signUpResponse, error) in
                
                if let error = error{
                    Toast.show(message: "Something went wrong!")
                    print("Something went wrong in SIGNUP THE USER. \(error.localizedDescription)")
                    
                } else if signUpResponse != nil{
                    
                    let user: UserProfile = UserProfile.fromSignUp(response: signUpResponse!)
                    user.isLoggedIn = true
                    user.save()
                    App.shared.updateUser()
                    
                    let homeNav = UIStoryboard.AppStoryboard.Main.instance.instantiateViewController(withIdentifier: UINavigationController.Identifiers.HomeNav) as! UINavigationController
                    UIApplication.shared.windows.filter {$0.isKeyWindow}.first!.replaceRootViewControllerWith(homeNav, animated: true, completion: nil)
                    
                } else{
                    Toast.show(message: "Something went wrong!")
                    print("Something went wrong in SIGNUP THE USER.")
                }
            }
        }
        
        
        
    }
    
    @IBAction func onClickBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func signUp() {
        
        
    }
    
    func isValidData() -> Bool {
        
        if txtEmail.text == nil || txtEmail.text == ""{
            Toast.show(message: "Email required!")
            return false
        } else if txtFirstName.text == nil || txtFirstName.text == ""{
            Toast.show(message: "First Name required!")
            return false
        } else if txtLastName.text == nil || txtLastName.text == ""{
            Toast.show(message: "Last Name required!")
            return false
        } else if txtAddress.text == nil || txtAddress.text == ""{
            Toast.show(message: "Address required!")
            return false
        } else if txtPassword.text == nil || txtPassword.text == ""{
            Toast.show(message: "Password required!")
            return false
        } else if txtPassword.text!.count < 6{
            Toast.show(message: "Password should be at least 6 digits!")
            return false
        }
        
        return true
    }
    
}
