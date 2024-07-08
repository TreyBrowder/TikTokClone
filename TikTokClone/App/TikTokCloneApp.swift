//
//  TikTokCloneApp.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/2/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct TikTokCloneApp: App {
    
    //register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    private let authService = AuthService()
    private let userService = UserService()
    
    var body: some Scene {
        WindowGroup {
            ContentView(authService: authService, userService: userService)
        }
    }
}
