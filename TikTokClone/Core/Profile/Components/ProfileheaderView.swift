//
//  ProfileheaderView.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/3/24.
//

import SwiftUI

struct ProfileheaderView: View {
    
    @State private var showEditProfile = false
    let user: User
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 8) {
                AvatarView(user: user, size: .large)
                
                //UserName
                Text("@\(user.username)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            
            //Stats View
            HStack(spacing: 16) {
                UserStatView(value: 5, title: "Following")
                UserStatView(value: 7, title: "Followers")
                UserStatView(value: 10, title: "Likes")
            }
            
            //Action Button
            Button(action: {
                showEditProfile.toggle()
            }, label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundStyle(.black)
                    .background(Color(.systemGray3))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            })
            
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

#Preview {
    ProfileheaderView(user: DeveloperPreview.user)
}

