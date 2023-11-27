//
//  RegisterView.swift
//  ToDoList
//
//  Created by Berkay Yaşar on 11.07.2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()

    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, background: .yellow)
            
            List {
                    // Your form content here
                    Section {
                        TextField("Full Name", text: $viewModel.name)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocorrectionDisabled()
                    }
                    Section {
                        TextField("Email Address", text: $viewModel.email)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                    }
                    Section {
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(DefaultTextFieldStyle())
                    }
                    Section {
                        TLButton(
                            title: "Create Account",
                            background: .green
                        ) {
                            viewModel.register()
                        }
                        .padding()
                    }
                }
                .frame(width: 352, height: 205)
                .listStyle(PlainListStyle()) // Remove default list styling
                .overlay(
                    RoundedRectangle(cornerRadius: 10) // Adjust the corner radius as needed
                        .stroke(Color.gray, lineWidth: 1)
                )
                .cornerRadius(10)
                .padding()
                .offset(y: -30)
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
