//
//  AuthService.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/5/24.
//

import Foundation
import Firebase

class AuthService {
    
    func login(withEmail email: String, password: String) async throws {
        print("DEBUG - LOG: AuthService Class - login method called")
    }
    
    func createUser(withEmail email: String,
                    password: String,
                    userName: String,
                    fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
        } catch {
            print("DEBUG - ERROR: Auth Service Class - createUser Method - Could NOT create user")
            print("DEBUG - ERROR: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        
    }
}
