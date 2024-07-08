//
//  EditProfileOptionRowView.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/8/24.
//

import SwiftUI

struct EditProfileOptionRowView: View {
    
    let option: EditProfileOptions
    let optionValue: String
    
    var body: some View {
        NavigationLink(value: option) {
            Text(option.title)
                .foregroundStyle(.primary)
            
            Spacer()
            
            Text(optionValue)
        }
    }
}

#Preview {
    EditProfileOptionRowView(option: EditProfileOptions.name, optionValue: "Trey Browder")
}
