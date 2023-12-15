//
//  RegisterView.swift
//  ToDoList
//
//  Created by Sativa Maciel` on 12/15/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Hello!", subtitle: "Register to get started", angle: -15, background: Color(red: 0.65, green: 0.84, blue: 0.66, opacity: 0.3))
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Create Account", background: Color(red: 0.11, green: 0.37, blue: 0.13)) {
                    // Attempt Registration
                    viewModel.register()
                }
                .padding()
            }
            .offset(y: -50)
            
            Spacer()
        }
        .background(Image("background")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
//        .background(Color(red: 0.65, green: 0.84, blue: 0.66, opacity: 0.3))
    }
}

#Preview {
    RegisterView()
}
