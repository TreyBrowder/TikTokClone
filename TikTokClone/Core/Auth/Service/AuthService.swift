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
        print("DEBUG - LOG: AuthService Class - createUser method called")
    }
    
    func signOut() {
        
    }
}
