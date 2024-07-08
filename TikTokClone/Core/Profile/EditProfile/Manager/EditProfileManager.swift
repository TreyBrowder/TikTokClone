//
//  EditProfileManager.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/8/24.
//

import Firebase
import UIKit

class EditProfileManager: ObservableObject {
    
    private let imageUploader: ImageUploader
    
    init(imageUploader: ImageUploader) {
        self.imageUploader = imageUploader
    }
    
    ///upload profile image to firebase storage
    func uploadProfileImage(_ uiImage: UIImage) async {
        do {
            let profileImageUrl = try await imageUploader.uploadImage(image: uiImage)
            try await updateUserProfileImageUrl(profileImageUrl)
        } catch {
            print("DEBUG - ERROR: Image upload error here....")
        }
    }
    
    ///update the users profile image URL in the firestore database
    private func updateUserProfileImageUrl(_ imageUrl: String?) async throws {
        guard let imageUrl else { return }
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        try await FirestoreConstants.UsersCollection.document(currentUid).updateData([
            "profileImageUrl": imageUrl
        ])
    }
}
