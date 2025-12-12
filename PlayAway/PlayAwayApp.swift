//
//  PlayAwayApp.swift
//  PlayAway
//
//  Created by kamila on 25/11/25.
//

import SwiftUI
import Firebase

@main
struct PlayAwayApp: App {
    @StateObject var authVM = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(authVM)
        }
    }
}
