//
//  EditProfileView.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/8/24.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Circle()
                        .frame(width: 64, height: 64)
                    
                    Button("Change Photo") {
                        print("DEBUG - LOG: Change photo tapped")
                    }
                    .foregroundStyle(.black)
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("About you")
                        .font(.footnote)
                        .foregroundStyle(Color(.systemGray2))
                        .fontWeight(.semibold)
                    
                    HStack {
                        Text("Name")
                        
                        Spacer()
                        
                        Text("Trey Browder")
                    }
                    
                    HStack {
                        Text("User name")
                        
                        Spacer()
                        
                        Text("T_Browder7")
                    }
                    
                    HStack {
                        Text("Bio")
                        
                        Spacer()
                        
                        Text("Add a bio")
                    }
                }
                .font(.subheadline)
                .padding()
                
                Spacer()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        print("DEBUG - LOG: Done editing tapped")
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        print("DEBUG - LOG: Cancel editing tapped")
                    }
                }
            }
            .fontWeight(.semibold)
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    EditProfileView()
}
