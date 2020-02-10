//
//  FirstViewController.swift
//  base_beta
//
//  Created by 後藤壱成 on 2020/02/11.
//  Copyright © 2020 kaito. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class FirstViewController: UIViewController {
    var handle: AuthStateDidChangeListenerHandle?

    override func viewDidLoad() {
        super.viewDidLoad()
        handle = Auth.auth().addStateDidChangeListener{auth, user in //ログイン画面飛ばすやつ
            if user != nil {
                self.performSegue(withIdentifier: "toMain", sender: auth)
            }
        }

        // Do any additional setup after loading the view.
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
