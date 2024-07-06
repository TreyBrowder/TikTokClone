//
//  PreviewProvider.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/6/24.
//

import Foundation

struct DeveloperPreview {
    
    static var user = User(id: NSUUID().uuidString,
                           username: "Trey_test",
                           email: "Trey@test.com",
                           fullname: "Trey Browder")
    
    static var users: [User] = [
        .init(id: NSUUID().uuidString, username: "Trey_test1", email: "trey@test1.com", fullname: "Trey test1"),
        .init(id: NSUUID().uuidString, username: "Trey_test2", email: "trey@test2.com", fullname: "Trey test2"),
        .init(id: NSUUID().uuidString, username: "Trey_test3", email: "trey@test3.com", fullname: "Trey test3"),
        .init(id: NSUUID().uuidString, username: "Trey_test4", email: "trey@test4.com", fullname: "Trey test4")
    ]
}
