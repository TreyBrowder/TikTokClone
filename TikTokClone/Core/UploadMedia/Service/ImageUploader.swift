//
//  ImageUploader.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/8/24.
//

import UIKit
import FirebaseStorage

struct ImageUploader {
    
    func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(fileName)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG - ERROR: Failed to upload image with error: \(error)")
            return nil
        }
    }
}
