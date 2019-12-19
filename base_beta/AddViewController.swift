//
//  AddViewController.swift
//  base_beta
//
//  Created by 後藤壱成 on 2019/11/28.
//  Copyright © 2019 kaito. All rights reserved.
//
//  質問を投稿するためのswift file
//  ここで, AddViewControllerに表示されているものすべてを扱っている.
//

import UIKit
import Firebase
import QuartzCore
//import FirebaseAuth
//import FirebaseDatabase

class AddViewController: UIViewController {
    @IBOutlet var contentTextView:  UITextView! // 追加

    var me: AppUser!

    //var DBRef: DatabaseReference!

    var database: Firestore!
    


    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextView()
        database = Firestore.firestore()

        // 枠のカラー
        contentTextView.layer.borderColor = UIColor.red.cgColor

        // 枠の幅
        contentTextView.layer.borderWidth = 1.0

        // 枠を角丸にする場合
        contentTextView.layer.cornerRadius = 10.0
        contentTextView.layer.masksToBounds = true
        
        //AddViewControllerのタイトルtext sizeの変更
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Times New Roman", size: 35)!]
        
        //ContentTextViewの表示するTextSizeの変更
        contentTextView.font = UIFont.systemFont(ofSize: 30)
    }


    @IBAction func postContent() {
        let content = contentTextView.text!
        let saveDocument = Firestore.firestore().collection("posts").document()
        _ = Auth.auth().currentUser!.uid
        saveDocument.setData([
            "content": content,//投稿内容
            "postID": saveDocument.documentID,//質問投稿のID
            //"senderID": me.userID!,
            "createdAt": FieldValue.serverTimestamp(),//質問した日時
            "updatedAt": FieldValue.serverTimestamp(),//最新の変更時刻
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
    
    //[戻る]ボタン追加
    @IBAction func backTimeLine(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
