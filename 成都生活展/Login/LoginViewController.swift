//
//  LoginViewController.swift
//  成都生活展
//
//  Created by pu on 2017/11/18.
//  Copyright © 2017年 pu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var accountTF: UITextField!
    @IBOutlet weak var passwdTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginBtn.layer.cornerRadius = 10
        loginBtn.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Swift 4
    @objc func btnPressed() {
        let account = "admin"
        let password = "1234"
        
        let userDef = UserDefaults.standard
        userDef.set(account, forKey: "account")
        userDef.set(password, forKey: "password")
        userDef.synchronize()
        
        if accountTF.text == account && passwdTF.text == password {
            let nextVC = TabBarController()
//            self.present(nextVC, animated: true, completion: {
//                print("Jump to nextVC")
//            })
            UIApplication.shared.keyWindow?.rootViewController = nextVC
        } else {
            print("please input right account or password!")
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}
