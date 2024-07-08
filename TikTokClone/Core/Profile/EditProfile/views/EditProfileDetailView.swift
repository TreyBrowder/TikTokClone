//
//  EditProfileDetailView.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/8/24.
//

import SwiftUI

struct EditProfileDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var value = ""
    
    let user: User
    let option: EditProfileOptions
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Add your bio", text: $value)
                
                Spacer()
                
                if !value.isEmpty {
                    Button {
                        value = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
            }
            
            Divider()
            
            Text("Tell us a little bit about yourself!")
                .font(.footnote)
                .foregroundStyle(.gray)
                .padding(.top)
            Spacer()
        }
        .padding()
        .navigationTitle(option.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .onAppear { onViewAppear() }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") { dismiss() }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    dismiss()
                }
                    .fontWeight(.semibold)
            }
            
        }
    }
}

private extension EditProfileDetailView {
    var subTitle: String {
        switch option {
        case .name:
            "Your full name can only be chagned once every  7days "
        case .username:
            "Usersnames can only contain letters, numbers, underscores, and periods"
        case .bio:
            "Tell us a little bit about yourself"
        }
    }
    
    func onViewAppear() {
        switch option {
        case .name:
            value = user.fullname
        case .username:
            value = user.username
        case .bio:
            value = user.bio ?? ""
        }
    }
}

#Preview {
    NavigationStack {
        EditProfileDetailView(user: DeveloperPreview.user, option: EditProfileOptions.username)
            .tint(.primary)
    }
}
