//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Berkay Yaşar on 11.07.2023.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
