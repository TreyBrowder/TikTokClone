//
//  FeedViewModel.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/5/24.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    let videoUrls = [
       "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
       "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
       "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
       "https://storage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
       "https://storage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"
    ]
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        self.posts = [
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[0]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[1]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[2]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[3]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[4])
        ]
    }
}
