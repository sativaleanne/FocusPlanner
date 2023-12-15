//
//  HeaderView.swift
//  ToDoList
//
//  Created by Sativa Maciel` on 12/15/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
//            Image("background")
//                .resizable()
//                .scaledToFill()
//                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.black)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.black)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: .blue)
}
