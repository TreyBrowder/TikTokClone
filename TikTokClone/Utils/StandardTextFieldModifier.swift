//
//  StandardTextFieldModifier.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/5/24.
//

import Foundation
import SwiftUI

struct StandardTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
    }
}
