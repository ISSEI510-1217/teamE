//
//  Reply.swift
//  base_beta
//
//  Created by 金城海斗 on 2019/12/18.
//  Copyright © 2019 kaito. All rights reserved.
//

import Foundation
import Firebase

struct Reply {
    let reply_content: String
    let postID: String
    let createdAt: Timestamp
    let updatedAt: Timestamp
    
    init(data: [String: Any]) {
        reply_content = data["reply_content"] as! String
        postID = data["postID"] as! String
        createdAt = data["createdAt"] as! Timestamp
        updatedAt = data["updatedAt"] as! Timestamp
    }
}
