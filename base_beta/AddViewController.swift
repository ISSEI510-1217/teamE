//
//  AddViewController.swift
//  base_beta
//
//  Created by 後藤壱成 on 2019/11/28.
//  Copyright © 2019 kaito. All rights reserved.
//

import UIKit
import Firebase
import QuartzCore
//import FirebaseAuth
//import FirebaseDatabase

class AddViewController: UIViewController {
    @IBOutlet var contentTextView:  UITextView! // 追加
    
    var me: AppUser!
    var DBRef: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 枠のカラー
        contentTextView.layer.borderColor = UIColor.red.cgColor

        // 枠の幅
        contentTextView.layer.borderWidth = 1.0

        // 枠を角丸にする場合
        contentTextView.layer.cornerRadius = 10.0
        contentTextView.layer.masksToBounds = true
    }
    
    
    @IBAction func postContent() {
        let content = contentTextView.text!
        //let user = AppUser.init(data: [String : Any])
        let saveDocument = Firestore.firestore().collection("posts").document()
        //_ = Auth.auth().currentUser!.uid
        saveDocument.setData([
            "content": content,
            "postID": saveDocument.documentID,
            //"senderID": user.uid,
            "createdAt": FieldValue.serverTimestamp(),
            "updatedAt": FieldValue.serverTimestamp()
        ]) { error in
            if error == nil {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func setupTextView() {
        let toolBar = UIToolbar() // キーボードの上に置くツールバーの生成
        let flexibleSpaceBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) // 今回は、右端にDoneボタンを置きたいので、左に空白を入れる
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard)) // Doneボタン
        toolBar.items = [flexibleSpaceBarButton, doneButton] // ツールバーにボタンを配置
        toolBar.sizeToFit()
        contentTextView.inputAccessoryView = toolBar // テキストビューにツールバーをセット
    }
    
    // RealtimeDataBaseに投稿内容を保存する
    // @IBAction func tappedPostButton(_ sender: AnyObject){ // ボタン未実装
    //     view.endEditing(true)
        
    //     DBRef = Database.database().reference()
    //     let data_content = ["content": contentTextView.text!]
    //     DBRef.child("questions").childByAutoId().setValue(data_content) // Databaseに質問の内容を保存
    // }

    // キーボードを閉じる処理。
    @objc func dismissKeyboard() {
        contentTextView.resignFirstResponder()
    }
    
}
