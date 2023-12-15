//
//  NewItemView.swift
//  ToDoList
//
//  Created by Sativa Maciel` on 12/15/23.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //Button
                TLButton(title: "Save", background: Color(red: 0.11, green: 0.37, blue: 0.13)) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all fields and select due date that is today or newer."))
            }
        }
        .background(Color(red: 0.65, green: 0.84, blue: 0.66, opacity: 0.3))
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
