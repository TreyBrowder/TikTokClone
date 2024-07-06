//
//  MockUserService.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/6/24.
//

import Foundation

struct MockUserService: UserServiceProtocol {
    func fetchAllUsers() async throws -> [User] {
        return DeveloperPreview.users
    }
}
