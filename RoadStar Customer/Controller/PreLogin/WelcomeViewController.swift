//
//  WelcomeViewController.swift
//  RoadStar Customer
//
//  Created by Roamer on 11/07/2020.
//  Copyright © 2020 Osama Azmat Khan. All rights reserved.
//

import UIKit

class WelcomeViewController: BaseViewController {

    
    override func setupUI() {
        
    }
    
    override func setupTheme() {
        super.setupTheme()
        
    }
    
    
    @IBAction func onClickSignIn(_ sender: Any) {
        let signInVC = UIStoryboard.AppStoryboard.PreLogin.instance.instantiateViewController(withIdentifier: UIViewController.Identifiers.PreLogin.SignInViewController) as! SigninViewController
        self.navigationController?.pushViewController(signInVC, animated: true)
    }
    
    @IBAction func onCLickSignUp(_ sender: Any) {
        let signUpVc = UIStoryboard.AppStoryboard.PreLogin.instance.instantiateViewController(withIdentifier: UIViewController.Identifiers.PreLogin.SignUpViewController) as! SignUpViewController
        self.navigationController?.pushViewController(signUpVc, animated: true)
    }
}
