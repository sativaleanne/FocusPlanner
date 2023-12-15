//
//  TLButton.swift
//  ToDoList
//
//  Created by Sativa Maciel` on 12/17/23.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            // Action
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }    }
}

#Preview {
    TLButton(title: "Title", background: .pink) {
        // Action
    }
}
