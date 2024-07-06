//
//  ExploreViewModel.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/6/24.
//

import Foundation
import FirebaseCore
import FirebaseFirestoreSwift
import FirebaseFirestore

@MainActor
class ExploreViewModel: ObservableObject {
    
    @Published var usersArray = [User]()
    private let userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol){
        self.userService = userService
        
        Task { await getAllUsers() }
        
    }
    
    private func getAllUsers() async {
        do {
            self.usersArray = try await userService.fetchAllUsers()
        }catch {
            print("DEBUG - ERROR: \(error.localizedDescription)")
        }
    }
}
