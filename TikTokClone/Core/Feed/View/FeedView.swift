//
//  FeedView.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/2/24.
//

import SwiftUI
import AVKit


struct FeedView: View {
    @StateObject var feedVM = FeedViewModel()
    @State private var scrollPosition: String?
    @State private var myPlayer = AVPlayer()
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(feedVM.posts) { post in
                    FeedCell(post: post, player: myPlayer)
                        .id(post.id)
                }
            }
            .scrollTargetLayout()
        }
        .onAppear { myPlayer.play() }
        .scrollPosition(id: $scrollPosition)
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .onChange(of: scrollPosition) { oldValue, newValue in
            //print("newValue: \(String(describing: newValue))")
            //print("oldValue: \(String(describing: oldValue))")
            playVideoOnChangeOfScrollPOsitoin(postId: newValue)
        }
    }
    
    func playVideoOnChangeOfScrollPOsitoin(postId: String?) {
        guard let currentPost = feedVM.posts.first(where: { $0.id == postId }) else { return
        }
        
        myPlayer.replaceCurrentItem(with: nil)
        let playerItem = AVPlayerItem(url: URL(string: currentPost.videoUrl)!)
        myPlayer.replaceCurrentItem(with: playerItem)
    }
}

#Preview {
    FeedView()
}
