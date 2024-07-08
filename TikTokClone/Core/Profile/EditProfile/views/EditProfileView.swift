//
//  EditProfileView.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/8/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedPickerItem: PhotosPickerItem?
    @State private var profileImage: Image?
    @State private var uiImage: UIImage?
    
    @StateObject var manager = EditProfileManager(imageUploader: ImageUploader())
    
    let user: User
    
    var body: some View {
        NavigationStack {
            VStack {

                PhotosPicker(selection: $selectedPickerItem, matching: .images) {
                    VStack {
                        if let image = profileImage {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 64, height: 64)
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 64, height: 64)
                                .clipShape(Circle())
                                .foregroundStyle(Color(.systemGray4))
                        }
                        
                        Text("Change Photo")
                            .foregroundStyle(.primary)
                    }
                }
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("About you")
                        .font(.footnote)
                        .foregroundStyle(Color(.systemGray2))
                        .fontWeight(.semibold)
                    
                    EditProfileOptionRowView(option: EditProfileOptions.name, 
                                             optionValue: user.fullname)
                    
                    EditProfileOptionRowView(option: EditProfileOptions.username,
                                             optionValue: user.username)
                    
                    EditProfileOptionRowView(option: EditProfileOptions.bio,
                                             optionValue: user.bio ?? "Add a bio")
                }
                .font(.subheadline)
                .padding()
                
                Spacer()
            }
            .task(id: selectedPickerItem) { await loadImage(fromItem: selectedPickerItem) }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: EditProfileOptions.self) { option in
                EditProfileDetailView(user: user, option: option)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        onDoneTapped()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .fontWeight(.semibold)
        }
    }
}

private extension EditProfileView {
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func onDoneTapped() {
        Task {
            guard let uiImage else { return }
            await manager.uploadProfileImage(uiImage)
            dismiss()
        }
    }
}

#Preview {
    EditProfileView(user: DeveloperPreview.user)
}
