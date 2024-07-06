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
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 48, height: 48)
                .foregroundStyle(Color(.systemGray3))
            
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
