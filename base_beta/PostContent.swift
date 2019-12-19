//
//  PostContent.swift
//  base_beta
//
//  Created by 後藤壱成 on 2019/12/11.
//  Copyright © 2019 kaito. All rights reserved.
//

import UIKit

class PostContent: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //PostContentのタイトルtext sizeの変更
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Times New Roman", size: 35)!]
    }
    //[戻る]ボタン
    @IBAction func backTiemline(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
