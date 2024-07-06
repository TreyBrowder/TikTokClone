//
//  ContentViewModel.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/6/24.
//

import Foundation
import FirebaseAuth
import Combine

class ContentViewModel: ObservableObject {
    
    ///Keep track of whether or not a user is logged in
    @Published var userSession: FirebaseAuth.User?
    
    private let authService: AuthService
    private var cancellables = Set<AnyCancellable>()
    
    init(authService: AuthService){
        self.authService = authService
        setUpSubscribers()
        authService.updateUserSession()
    }
    
    private func setUpSubscribers() {
        authService.$userSession.sink { [weak self] user in
            self?.userSession = user
        }.store(in: &cancellables)
    }
}
