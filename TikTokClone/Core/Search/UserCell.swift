//
//  UserCell.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/3/24.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(spacing: 12) {
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 48, height: 48)
                .foregroundStyle(Color(.systemGray3))
            
            VStack(alignment: .leading) {
                Text("UserName_User")
                    .font(.headline)
                    .bold()
                
                Text("Firstname Lastname")
                    .font(.subheadline)
            }
            
            Spacer()
        }
    }
}

#Preview {
    UserCell()
}
