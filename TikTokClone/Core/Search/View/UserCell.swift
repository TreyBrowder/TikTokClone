//
//  UserCell.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/3/24.
//

import SwiftUI

struct UserCell: View {
    
    let user: User
    
//    init(user: User) {
//        self.user = user
//    }
    
    var body: some View {
        HStack(spacing: 12) {
            
            AvatarView(user: user, size: .medium)

            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.headline)
                    .bold()
                
                Text(user.fullname)
                    .font(.subheadline)
            }
            .foregroundStyle(.black)
            
            Spacer()
        }
    }
}

#Preview {
    UserCell(user: DeveloperPreview.user)
}
