//
//  AvatarSize.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/8/24.
//

import Foundation

enum AvatarSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall:
            28
        case .xSmall:
            32
        case .small:
            40
        case .medium:
            48
        case .large:
            64
        case .xLarge:
            80
        }
    }
}
