//
//  UserProfileView.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/6/24.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack {
                
                //profile header
                ProfileheaderView(user: user)
                
                //post grid
                PostGridView()
            }
            .padding(.top)
        }
    }
}

#Preview {
    UserProfileView(user: DeveloperPreview.user)
}
