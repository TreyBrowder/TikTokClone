//
//  ExploreView.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/3/24.
//

import SwiftUI

struct ExploreView: View {
    @StateObject private var exploreVM = ExploreViewModel(userService: UserService())
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(exploreVM.usersArray) { user in
                        NavigationLink(value: user) {
                            UserCell(user: user)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: User.self) { user in
                UserProfileView(user: user)
            }
        }
    }
}

#Preview {
    ExploreView()
}
