//
//  CurrentUserProfileView.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/3/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 2) {
                    //profile header
                    ProfileheaderView()
                    
                    //post Grid view
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
