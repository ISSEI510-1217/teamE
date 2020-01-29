//
//  Reply.swift
//  base_beta
//
//  Created by 金城海斗 on 2019/12/18.
//  Copyright © 2019 kaito. All rights reserved.
//

import Foundation
import Firebase
//Replyした投稿内容の変数定義(Post.swiftと同じようなもの)
struct Reply {
    let reply_content: String
    let postID: String
    let createdAt: Timestamp
    let updatedAt: Timestamp
    //変数のた型指定
    init(data: [String: Any]) {
        reply_content = data["reply_content"] as! String
        postID = data["postID"] as! String
        createdAt = data["createdAt"] as! Timestamp
        updatedAt = data["updatedAt"] as! Timestamp
    }
}
