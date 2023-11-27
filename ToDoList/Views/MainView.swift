//
//  ContentView.swift
//  ToDoList
//
//  Created by Berkay Yaşar on 11.07.2023.
//

import SwiftUI
struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            // signed in
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
   var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                  Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                  Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
