//
//  ContentView.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/2/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contentVM: ContentViewModel
    
    private let authService: AuthService
    private let userService: UserService
    
    init(authService: AuthService, userService: UserService) {
        self.authService = authService
        self.userService = userService
        
        let vm = ContentViewModel(authService: authService, userService: userService)
        self._contentVM = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        Group {
            if contentVM.userSession != nil {
                if let user = contentVM.currentUser {
                    MainTabView(authService: authService,
                                userService: userService,
                                user: user)
                }
            } else {
                LoginView(authService: authService)
            }
        }
    }
}

#Preview {
    ContentView(authService: AuthService(), userService: UserService())
}
