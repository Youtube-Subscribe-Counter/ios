//
//  iosApp.swift
//  ios
//
//  Created by Munkyu Yang on 7/3/25.
//

import SwiftUI

@main
struct iosApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .background(Color(hex: "FFFBEF"))
        }
    }
}
