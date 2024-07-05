//
//  LoginViewModel.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/5/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    private let authService: AuthService
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func login(withEmail email: String, password: String) async {
        do {
            try await authService.login(withEmail: email, password: password)
        } catch {
            //handle error here
            print("DEBUG - ERROR: \(error.localizedDescription)")
        }
    }
}
