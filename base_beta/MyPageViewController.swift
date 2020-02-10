//
//  MyPageViewController.swift
//  base_beta
//
//  Created by 山本勝己 on 2019/12/18.
//  Copyright © 2019  . All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase

class MyPageViewController: UIViewController {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    static var degree : String = ""
    static var num :String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = Auth.auth().currentUser
        let email = user?.email
        label1.text = email
        label2.text = MyPageViewController.degree
        label3.text = MyPageViewController.num
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

