//
//  User.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/6/24.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let username: String
    let email: String
    let fullname: String
    var bio: String?
    var profileImageUrl: String?
}

extension User: Hashable { }
