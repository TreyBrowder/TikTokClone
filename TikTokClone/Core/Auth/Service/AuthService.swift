//
//  AuthService.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/5/24.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    func updateUserSession(){
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        print("DEBUG - LOG: AuthService Class - login method called")
        
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG - LOG: Successful login with user: \(result.user)")
        } catch {
            print("DEBUG - ERROR: Auth Service Class - login Method - Could NOT login with user")
            print("DEBUG - ERROR: \(error.localizedDescription)")
            throw error
        }
    }
    
    func createUser(withEmail email: String,
                    password: String,
                    userName: String,
                    fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG - LOG: Auth Service class CreateUser Method")
            print("DEBUG - LOG: Successfully created user: \(result.user.uid)")
        } catch {
            print("DEBUG - ERROR: Auth Service Class - createUser Method - Could NOT create user")
            print("DEBUG - ERROR: \(error.localizedDescription)")
            throw error
        }
    }
    
    ///Sign current user out
    func signOut() {
        
        //Sign user out in the backend
        try? Auth.auth().signOut()
        
        //update routing logic by wiping the user session
        self.userSession = nil
        
    }
}
