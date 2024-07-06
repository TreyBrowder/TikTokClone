//
//  UserService.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/6/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore

struct UserService {
    
    func uploadUserData(_ user: User) async throws {
        do {
            let userData = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(userData)
        }catch {
            throw error
        }
    }
    
}
