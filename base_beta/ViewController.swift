//
//  ViewController.swift
//  base_beta
//
//  Created by 金城海斗 on 2019/11/13.
//  Copyright © 2019 kaito. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class ViewController: UIViewController{
    
    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var degreeField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var DBRef: DatabaseReference!
    var handle: AuthStateDidChangeListenerHandle?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        handle = Auth.auth().addStateDidChangeListener{auth, user in　//ログイン画面飛ばすやつ
//            if user != nil {
//                self.performSegue(withIdentifier: "toMainView", sender: auth)
//            }
//        }
        
    }
    
    
    @IBAction func pushed_signup_button(_ sender: Any) {
        let email = mailField.text!
        let password = passwordField.text!
        if password.count < 6 {
            let alert = UIAlertController(title: "パスワードエラー", message: "パスワードは６文字上にしてください。", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error == nil, let result = result {
                result.user.sendEmailVerification { (error) in
                    if error == nil {
                        let alert = UIAlertController(title: "仮登録を行いました。", message: "入力したメールアドレス宛に確認メールを送信しました。", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            } else if error != nil {
                let alert = UIAlertController(title: "登録エラー", message: "新規登録ができませんでした。メールアドレスの形式などを確認してください。", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func pushed_login_button(_ sender: Any) {
        let email = mailField.text!
        let password = passwordField.text!
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error == nil, let result = result, result.user.isEmailVerified {
                self.performSegue(withIdentifier: "toMainView", sender: result.user)
            } else if error != nil {
                let alert = UIAlertController(title: "ログインエラー", message: "パスワードまたはメールアドレスが違います。", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    @IBAction func add(_ sender: AnyObject) {
        DBRef = Database.database().reference()
        //let mail = mailField.text! //この変数を階層構造に用いたい
        let data_degree = ["degree": degreeField.text!]
        DBRef.child("user/01").setValue(data_degree)
        
    }
    
    @IBAction func pushed_Logout_button(_ sender: Any) {
        _ = Auth.auth()
        do {
            try Auth.auth().signOut()
            //self.performSegue(withIdentifier: "login", sender: firebaseAuth)
            print("all right")
        } catch let signOutError as NSError {
            print("Error signing out: %@",signOutError)
        }
    }
}

