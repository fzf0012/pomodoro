//
//  todoApp.swift
//  todo
//
//  Created by Frank on 11/25/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct PomodoroApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    // Create an instance of AuthenticationViewModel
    @StateObject var authViewModel = AuthenticationViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    // Inject the ViewModel into the environment
                    .environmentObject(authViewModel)  
            }
        }
    }
}
