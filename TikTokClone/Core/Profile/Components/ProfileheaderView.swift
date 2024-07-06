//
//  ProfileheaderView.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/3/24.
//

import SwiftUI

struct ProfileheaderView: View {
    
    let user: User
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 8) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .foregroundStyle(Color(.systemGray3))
                    .frame(width: 80, height: 80)
                
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
                
            }, label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundStyle(.black)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            })
            
            Divider()
        }
    }
}

#Preview {
    ProfileheaderView(user: DeveloperPreview.user)
}

