//
//  DZ2_PoletaevAVApp.swift
//  DZ2_PoletaevAV
//
//  Created by Алексей Полетаев on 19.12.2021.
//

import SwiftUI
import SwiftUINavigator

@main
struct DZ2_PoletaevAVApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationContainerView(transition: .custom(.opacity.animation(.default))) {
                ContentView()
            }
        }
    }
}
