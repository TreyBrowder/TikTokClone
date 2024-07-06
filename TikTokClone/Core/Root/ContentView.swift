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
    
    init(authService: AuthService) {
        self.authService = authService
        
        let vm = ContentViewModel(authService: authService)
        self._contentVM = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        Group {
            if contentVM.userSession != nil {
                MainTabView(authService: authService)
            } else {
                LoginView(authService: authService)
            }
        }
    }
}

#Preview {
    ContentView(authService: AuthService())
}
