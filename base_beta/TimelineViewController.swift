//
//  TimelineViewController.swift
//  base_beta
//
//  Created by 後藤壱成 on 2019/11/28.
//  Copyright © 2019 kaito. All rights reserved.
//
//  TimeLine画面についてswift file

//

import UIKit
import Firebase
import FirebaseFirestore


class TimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet var tableView: UITableView!

    var me: AppUser!
    var database: Firestore! // 宣言

    //Post型の空の配列postArrayを定義
    var postArray: [Post] = []

    var postArrayContents: [String] = []



    override func viewDidLoad() {
        super.viewDidLoad()
        database = Firestore.firestore() // 初期値代入

//        let press = UILongPressGestureRecognizer(target: self, action: #selector(pressScreen))
//        press.minimumPressDuration = 1.5
//        view.isUserInteractionEnabled = true
//        view.addGestureRecognizer(press)

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
//        self.view.addSubview(tableView)

        searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:42)
        searchBar.layer.position = CGPoint(x: self.view.bounds.width/2, y: 89)
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.showsSearchResultsButton = false
        searchBar.placeholder = "Search"
//        searchBar.setValue("Cancel", forKey: "_cancelButtonText")
//        searchBar.tintColor = UIColor.red

        tableView.tableHeaderView = searchBar
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        database.collection("posts").order(by: "updatedAt", descending: true ).getDocuments { (snapshot, error) in
            if error == nil, let snapshot = snapshot {
                self.postArray = []
                self.postArrayContents = []
                for document in snapshot.documents {
                    let data = document.data()
                    let post = Post(data: data)
                    self.postArray.append(post)
                    self.postArrayContents.append(post.content)
                }
                self.tableView.reloadData()
            }
        }

//        database.collection("users").document(me.userID).setData([
//            "userID": me.userID as Any
//            ], merge: true)
//
//        database.collection("users").document(me.userID).getDocument { (snapshot, error) in
//            if error == nil, let snapshot = snapshot, let data = snapshot.data() {
//                self.me = AppUser(data: data)
//            }
//        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "Add" {
//            let destination = segue.destination as! AddViewController
//            destination.me = sender as? AppUser
//        } else if segue.identifier == "Menu" {
//            let destination = segue.destination as! MenuViewController
//            destination.me = me//sender as? AppUser
//        }

//        let destination = segue.destination as! AddViewController // segue.destinationで遷移先のViewControllerが取得可能。
//        destination.me = sender as? AppUser
    }

//    @objc
//    func pressScreen() {
//        performSegue(withIdentifier: "Settings", sender: me)
//    }

    // 投稿追加画面に遷移するボタンを押したときの動作を記述。
//    @IBAction func toAddViewController(_ sender: Any) {
//        performSegue(withIdentifier: "Add", sender: me)
//    }
    @IBAction func toAddViewController(_ sender: Any) {
        performSegue(withIdentifier: "Add", sender: me)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBar.text != "" {
            return searchResults.count
        } else {
            return postArrayContents.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
            if searchBar.text != "" {
                cell.textLabel!.text = "\(searchResults[indexPath.row])"
            } else {
                cell.textLabel!.text = "\(postArrayContents[indexPath.row])"
            }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
//        cell.textLabel?.text = postArray[indexPath.row].content
        return cell
//        database.collection("users").document(postArray[indexPath.row].senderID).getDocument { (snapshot, error) in
//                    if error == nil, let snapshot = snapshot, let data = snapshot.data() {
//                        let appUser = AppUser(data: data)
//                        cell.detailTextLabel?.text = appUser.userName
//                    }
//                }
    }
    @IBAction func MenuButton(_ sender: Any) {
        performSegue(withIdentifier: "Menu", sender: me)
    }


    var searchResults:[String] = []
    var searchBar = UISearchBar()

    // 検索ボタンが押された時に呼ばれる
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        searchBar.showsCancelButton = true
        self.searchResults = postArrayContents.filter{
            // 大文字と小文字を区別せずに検索
            $0.lowercased().contains(searchBar.text!.lowercased())
        }
        self.tableView.reloadData()
    }

    // キャンセルボタンが押された時に呼ばれる
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        self.view.endEditing(true)
        searchBar.text = ""
        self.tableView.reloadData()
    }

    // テキストフィールド入力開始前に呼ばれる
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }
}
