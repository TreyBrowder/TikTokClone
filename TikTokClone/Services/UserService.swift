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

protocol UserServiceProtocol {
    func fetchAllUsers() async throws -> [User]
}

struct UserService: UserServiceProtocol {
    
    func uploadUserData(_ user: User) async throws {
        do {
            let userData = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(userData)
        }catch {
            throw error
        }
    }
    
    func fetchAllUsers() async throws -> [User]{
        print("DEBUG - LOG: Getting all users from the database...")
        let usersSnapShot = try await Firestore.firestore().collection("users").getDocuments()
        print("DEBUG - LOG: Successfully got all users from the database!")
        return usersSnapShot.documents.compactMap({ try? $0.data(as: User.self) })
    }
}
