//
//  LoginViewController.swift
//  Twitter
//
//  Created by Huanjia Liang on 2/3/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true
        {
            self.performSegue(withIdentifier: "logInToHome", sender: self)
        }
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        
        let myURL = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: myURL, success: {
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            //every time the user login, the program will create a key
            //called userLoggedIn, and set it to true.
            self.performSegue(withIdentifier: "logInToHome", sender: self)
        }, failure: { (Error) in
            print("Could not print")
        })
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
