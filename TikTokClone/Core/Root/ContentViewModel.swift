//
//  ContentViewModel.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/6/24.
//

import Foundation
import FirebaseAuth
import Combine

@MainActor
class ContentViewModel: ObservableObject {
    
    ///Keep track of whether or not a user is logged in
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    private let authService: AuthService
    private let userService: UserService
    private var cancellables = Set<AnyCancellable>()
    
    init(authService: AuthService, userService: UserService){
        self.authService = authService
        self.userService = userService
        setUpSubscribers()
        authService.updateUserSession()
    }
    
    private func setUpSubscribers() {
        authService.$userSession.sink { [weak self] user in
            self?.userSession = user
            self?.getCurrentUser()
        }.store(in: &cancellables)
    }
    
    func getCurrentUser() {
        guard userSession != nil else { return }
        Task { self.currentUser = try await userService.fetchCurrentUser() }
    }
}
