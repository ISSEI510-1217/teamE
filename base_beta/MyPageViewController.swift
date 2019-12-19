//
//  MyPageViewController.swift
//  base_beta
//
//  Created by 山本勝己 on 2019/12/18.
//  Copyright © 2019 kaito. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = "email address:"
        label2.text = "student number:"
        label3.text = "degree:"
        label4.text = "password:"
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
