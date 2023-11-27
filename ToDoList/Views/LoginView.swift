//
//  LoginView.swift
//  ToDoList
//
//  Created by Berkay Yaşar on 11.07.2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                // Header
                HeaderView(title: "To Do List", subtitle: "by Berkay YAŞAR", angle: 15, background: .red)
                
                List {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    Section {
                        TextField("Email Address", text: $viewModel.email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.top, 10)
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                    }
                    .listRowSeparator(.hidden)

                    
                    Section {
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .listRowSeparator(.hidden)
                    
                    Section {
                        TLButton(
                            title: "Login",
                            background: .blue
                        ) {
                            viewModel.login()
                        }
                    }
                    .listRowSeparator(.hidden)
                    .padding()
                }

                .frame(width: 352, height: viewModel.errorMessage.isEmpty ? 180: 240)
                .listStyle(PlainListStyle()) // Remove default list styling
                .overlay(
                    RoundedRectangle(cornerRadius: 10) // Adjust the corner radius as needed
                        .stroke(Color.gray, lineWidth: 1)
                )
                .cornerRadius(10)
                .offset(y: -50)

                // FORM VERSION
//                Form {
//                    
//                    if !viewModel.errorMessage.isEmpty {
//                        Text(viewModel.errorMessage).foregroundColor(Color.red)
//                    }
//                    
//                    TextField("Email Address", text: $viewModel.email)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.top, 10)
//                        .autocapitalization(.none)
//                        .autocorrectionDisabled()
//                    
//                    SecureField("Password", text: $viewModel.password)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                    
//                    TLButton(
//                        title: "Login",
//                        background: .blue
//                    ) {
//                        viewModel.login()
//                    }
//                }
//                .offset(y: -50)
                
                // Create Account
                VStack{
                    Text("New around here?")
                    
                    NavigationLink("Create An Account",destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
}
