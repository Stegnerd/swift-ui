//
//  LandmarksApp.swift
//  WatchLandmarks Extension
//
//  Created by Dalton Stegner on 10/3/20.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
