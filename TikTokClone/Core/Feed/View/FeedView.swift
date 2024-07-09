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
                        .onAppear { playInitVideoIfNeeded() }
                }
            }
            .scrollTargetLayout()
        }
        .onAppear { myPlayer.play() }
        .onDisappear { myPlayer.pause() }
        .scrollPosition(id: $scrollPosition)
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .onChange(of: scrollPosition) { oldValue, newValue in
            playVideoOnChangeOfScrollPOsitoin(postId: newValue)
        }
    }
    
    func playInitVideoIfNeeded(){
        guard scrollPosition == nil,
              let post = feedVM.posts.first,
              myPlayer.currentItem == nil else { return }
        let item = AVPlayerItem(url: URL(string: post.videoUrl)!)
        myPlayer.replaceCurrentItem(with: item)
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
