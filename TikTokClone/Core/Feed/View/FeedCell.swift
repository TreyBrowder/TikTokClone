//
//  FeedCell.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/2/24.
//

import SwiftUI
import AVKit

struct FeedCell: View {
    let post: Post
    var myPlayer: AVPlayer
    
    init(post: Post, player: AVPlayer) {
        self.post = post
        self.myPlayer = player
    }
    var body: some View {
        ZStack {
            MyVideoPlayer(player: myPlayer)
                .containerRelativeFrame([.horizontal, .vertical])
            
            VStack {
                Spacer()
                
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("Placeholder Username")
                            .fontWeight(.semibold)
                        Text("Placeholder Text for Caption Here")
                    }
                    .font(.subheadline)
                    .foregroundStyle(.white)
                    
                    Spacer()
                    
                    VStack(spacing: 28) {
                        
                        Circle()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.gray)
                        
                        Button(action: {
                            
                        }, label: {
                            VStack {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.white)
                                Text("11")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                                
                        })
                        
                        
                        Button(action: {
                            
                        }, label: {
                            VStack {
                                Image(systemName: "ellipsis.bubble.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.white)
                                Text("234")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        })
                        
                        
                        Button(action: {
                            
                        }, label: {
                            VStack {
                                Image(systemName: "bookmark.fill")
                                    .resizable()
                                    .frame(width: 20, height: 28)
                                    .foregroundStyle(.white)
                            }
                        })
                        
                        
                        Button(action: {
                            
                        }, label: {
                            VStack {
                                Image(systemName: "arrowshape.turn.up.right.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.white)
                            }
                        })
                        
                    }
                }
                .padding(.bottom, 80)
            }
            .padding()
        }
        .onTapGesture {
            switch myPlayer.timeControlStatus {
            case .paused:
                myPlayer.play()
            case .waitingToPlayAtSpecifiedRate:
                break
            case .playing:
                myPlayer.pause()
            @unknown default:
                break
            }
        }
    }
}

#Preview {
    FeedCell(post: Post(id: NSUUID().uuidString, 
                        videoUrl: "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4"),
                        player: AVPlayer())
}
