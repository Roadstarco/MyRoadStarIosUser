//
//  SigninViewController.swift
//  RoadStar Customer
//
//  Created by Roamer on 11/07/2020.
//  Copyright © 2020 Osama Azmat Khan. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class SigninViewController: BaseViewController {

    @IBOutlet weak var txtPassword: SkyFloatingLabelTextField!
    @IBOutlet weak var txtEmail: SkyFloatingLabelTextField!
  
    override func setupUI() {
        
        txtEmail.text = "tester@test.com"
        txtPassword.text = "1234Abc@"
    }
    
    override func setupTheme() {
        super.setupTheme()
        
    }

    @IBAction func onCLickNextBtn(_ sender: Any) {
        
        if isValid(){
            
            let logIn = LogIn(grant_type: "password", client_id: 2, client_secret: "WX2IZR5Yi6gpZ3ajSJ4meKik3R0K1z2vomJVc2Qw", username: txtEmail.text!, password: txtPassword.text!, scope: "", device_type: "ios", device_id: "d7efe9cadf4f483e", device_token: "fRfI-VPhQcy_oD93FQdnrp:APA91bERv1cOgZBghbd0orQu1snCMBHA00ntwWfVYOJyyT4ADSSAlZVrttaixMDL_ocWCvIz6-pQuIdLM-VRVCUMZ9vUfpvAXqzw1IfZlF1VFWhw1Prc34979L2dAKJ1VU6uGNjRroPo")
            
            NetworkRepository.shared.logInRepository.logIn(with: logIn) { (logInResponse, error) in
                
                if let error = error{
                    Toast.show(message: "Something went wrong!")
                    print("Something went wrong in SIGNUP THE USER. \(error.localizedDescription)")
                    
                } else if let loginRes = logInResponse{
                    
                    print(loginRes.access_token ?? "no token")
                    
                    UserDefaults.standard.setValue(loginRes.access_token, forKey: "loginToken")
                    UserDefaults.standard.synchronize()
                    
                    let homeNav = UIStoryboard.AppStoryboard.Main.instance.instantiateViewController(withIdentifier: UINavigationController.Identifiers.HomeNav) as! UINavigationController
                    UIApplication.shared.windows.filter {$0.isKeyWindow}.first!.replaceRootViewControllerWith(homeNav, animated: true, completion: nil)
                    
                } else{
                    Toast.show(message: "Something went wrong!")
                    print("Something went wrong in SIGNUP THE USER.")
                }
            }
        }
        
    }
    
    @IBAction func onCLickSignUp(_ sender: Any) {
        let signUpVc = UIStoryboard.AppStoryboard.PreLogin.instance.instantiateViewController(withIdentifier: UIViewController.Identifiers.PreLogin.SignUpViewController) as! SignUpViewController
        self.navigationController?.pushViewController(signUpVc, animated: true)
    }
    
    @IBAction func onCLickForgotPassBtn(_ sender: Any) {
        let forgotPassVC = UIStoryboard.AppStoryboard.PreLogin.instance.instantiateViewController(withIdentifier: UIViewController.Identifiers.PreLogin.ForgetPasswordViewController) as! ForgetPasswordViewController
        self.navigationController?.pushViewController(forgotPassVC, animated: true)
    }
    
    @IBAction func onClickBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func isValid() -> Bool {
        
        if txtEmail.text == nil || txtEmail.text == ""{
            Toast.show(message: "Email field is empty.")
            return false
        } else if txtPassword.text == nil || txtPassword.text == ""{
            Toast.show(message: "Password field is empty.")
            return false
        }
        return true
    }
    
}
