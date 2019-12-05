//
//  MyPageViewController.swift
//  base_beta
//
//  Created by 山本勝己 on 2019/12/05.
//  Copyright © 2019 kaito. All rights reserved.
//

import UIKit
//個人のメールアドレス、学年などが確認できる。
class MyPageViewController: UIViewController {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let mail = "e185711@"//メールアドレスの参照
               let str = "e-mail address:\(mail)"
               label1.text=str//label1にメールアドレスを表示
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
