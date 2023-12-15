//
//  LoginView.swift
//  ToDoList
//
//  Created by Sativa Maciel` on 12/15/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
            NavigationView(){
                ZStack {
                    VStack{
                            // Header
                        HeaderView(title: "Log In", subtitle: "Welcome Back!", angle: 15, background: Color(red: 0.65, green: 0.84, blue: 0.66, opacity: 0.3))
                            
                            // Login Form
                            
                            Form {
                                
                                if !viewModel.errorMessage.isEmpty {
                                    Text(viewModel.errorMessage)
                                        .foregroundColor(Color.red)
                                }
                                
                                TextField("Email Address", text: $viewModel.email)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .autocapitalization(.none)
                                
                                SecureField("Passord", text: $viewModel.password)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                                TLButton(title: "Login", background: Color(red: 0.11, green: 0.37, blue: 0.13)) {
                                    // Attempt Login
                                    viewModel.login()
                                }
                                .padding()
                            }
                            .offset(y: -50)
                            
                            Spacer()
                            
                            // Acount Form
                            VStack {
                                Text("New Around Here?")
                                
                                NavigationLink("Create an Account", destination: RegisterView())
                            }
                            .padding()
                            
                    }
                    .background(Image("background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
//                    .background(Color(red: 0.65, green: 0.84, blue: 0.66, opacity: 0.3))
                }
                }
        }
}

#Preview {
    LoginView()
}
