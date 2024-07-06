//
//  CurrentUserProfileView.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/3/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let authService: AuthService

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 2) {
                    //profile header
                    ProfileheaderView(user: DeveloperPreview.user)
                    
                    //post Grid view
                    PostGridView()
                }
                .padding(.top)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Sign Out") {
                        print("SignOut here")
                        authService.signOut()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(authService: AuthService())
}
