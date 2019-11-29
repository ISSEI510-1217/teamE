//
//  AccountViewController.swift
//  base_beta
//
//  Created by 後藤壱成 on 2019/11/28.
//  Copyright © 2019 kaito. All rights reserved.
//

import UIKit
import Firebase

class AccountViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    var auth: Auth

    override func viewDidLoad() {
        super.viewDidLoad()
        auth = Auth.auth()
        emailTextField.delegate = self
        passwordTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    // 登録ボタンを押したときに呼ぶメソッド。
    @IBAction func registerAccount() {

    }
    
    // デリゲートメソッドは可読性のためextensionで分けて記述します。
    extension AccountViewController: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
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
