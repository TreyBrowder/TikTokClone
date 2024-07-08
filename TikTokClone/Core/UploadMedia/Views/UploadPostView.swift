//
//  UploadPostView.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/8/24.
//

import SwiftUI

struct UploadPostView: View {
    @State private var captionText = ""
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                TextField("Enter your caption", text: $captionText, axis: .vertical)
                
                Spacer()
                
                Image(systemName: "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 88, height: 100)
                    .clipShape(.rect(cornerRadius: 10))
            }
            
            Divider()
            
            Spacer()
            
            Button {
                print("DEBUG - LOG: uploading post")
            } label: {
                Text("Post")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 352, height: 44)
                    .background(Color(.systemPink))
                    .clipShape(.rect(cornerRadius: 8))
            }
        }
        .padding()
    }
}

#Preview {
    UploadPostView()
}
