//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Alfred  Lucero on 10/11/21.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        let mainWindow = WindowGroup {
           ContentView()
               .environmentObject(modelData)
        }
        
        #if os(macOS)
            mainWindow
                .commands {
                    LandmarkCommands()
                }
        #else
            mainWindow
        #endif
        
        #if os(watchOS)
            WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
        
        #if os(macOS)
           Settings {
               LandmarkSettings()
           }
       #endif
    }
}
