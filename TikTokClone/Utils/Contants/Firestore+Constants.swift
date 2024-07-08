//
//  Firestore+Constants.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/8/24.
//

import Foundation
import FirebaseFirestore

struct FirestoreConstants {
    static let FirestoreRoot = Firestore.firestore()
    
    static let UsersCollection = FirestoreRoot.collection("users")
}
