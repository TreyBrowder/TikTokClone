//
//  NotificationsCell.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/3/24.
//

import SwiftUI

struct NotificationsCell: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundStyle(Color(.systemGray3))
                .frame(width: 32, height: 32)
            
            HStack {
                Text("Trey_B")
                    .font(.footnote)
                    .fontWeight(.semibold) +
                
                Text(" Liked one of your post.  ")
                    .font(.footnote) +
                
                Text(" 1h ago")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Rectangle()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationsCell()
}
