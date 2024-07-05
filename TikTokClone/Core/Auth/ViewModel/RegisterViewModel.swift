//
//  RegisterViewModel.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/5/24.
//

import Foundation

class RegisterViewModel: ObservableObject {
    
    private let authServices: AuthService
    
    init(authServices: AuthService) {
        self.authServices = authServices
    }
    
    func createUser(withEmail email: String,
                    password: String,
                    username: String,
                    fullName: String) async {
        do {
            try await authServices.createUser(withEmail: email,
                                              password: password,
                                              userName: username,
                                              fullName: fullName)
        } catch {
            print("DEBUG - ERROR: \(error.localizedDescription)")
        }
    }
}
