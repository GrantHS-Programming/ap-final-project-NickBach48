//
//  NewAppApp.swift
//  NewApp
//
//  Created by Nicholas Auerbach on 4/17/24.
//

import SwiftUI

@main
struct NewAppApp: App {
    var body: some Scene {
        WindowGroup {
            OpenScreen();
            ContentView().background(Color.red);
        }
    }
}
