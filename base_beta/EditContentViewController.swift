//
//  EditContentViewController.swift
//  base_beta
//
//  Created by 山本勝己 on 2019/12/20.
//  Copyright © 2019 kaito. All rights reserved.
//

import UIKit
import FirebaseFirestore
import QuartzCore

class EditContentViewController: UIViewController {
    @IBOutlet weak var edit: UITextView!
    //editのUI設定関数
    func edit_optin(){
        //枠線のUI
        edit.layer.borderColor = UIColor.blue.cgColor
        edit.layer.borderWidth = 2.0
        edit.layer.cornerRadius = 10.0
        edit.layer.masksToBounds = true
    }
    @IBAction func repostcontent(_ sender: Any) {
        let content = edit.text!
        //let user = Auth.auth().currentUser?.uid
        let saveDocument = Firestore.firestore().collection("post").document("\(TimelineViewController.postID_dash)")
        saveDocument.setData([
            "content": content,//投稿内容
            "postID": saveDocument.documentID,
            "createdAt": TimelineViewController.createdAt,//質問した日時
            "updatedAt": FieldValue.serverTimestamp(),//最新の変更時刻
            "userID": TimelineViewController.userID  //質問者のID
        ]) { error in
            if error == nil {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edit_optin()
        edit.text = TimelineViewController.content_dash
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
