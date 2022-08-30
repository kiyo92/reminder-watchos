//
//  listAppApp.swift
//  listApp WatchKit Extension
//
//  Created by Jaqueline Oliveira on 29/08/22.
//

import SwiftUI

@main
struct listAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
