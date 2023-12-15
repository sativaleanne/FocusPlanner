//
//  ProfileView.swift
//  ToDoList
//
//  Created by Sativa Maciel` on 12/15/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
            .background(Color(red: 0.65, green: 0.84, blue: 0.66, opacity: 0.3))
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color(red: 0.65, green: 0.84, blue: 0.66, opacity: 1.0))
            .frame(width: 125, height: 125)
            .padding()
        
        // Info: Name, Email, Member since
        VStack(alignment: .leading) {
            HStack {
                Text("Name:")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email:")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Member Since:")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        //Sign out
        Button("Log Out") {
            viewModel.logOut()
        }
        .tint(Color.red)
        .padding()
        
        Spacer()
    }
    
}

#Preview {
    ProfileView()
}
