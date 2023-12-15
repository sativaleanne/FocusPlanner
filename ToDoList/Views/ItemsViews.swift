//
//  ItemsViews.swift
//  ToDoList
//
//  Created by Sativa Maciel` on 12/15/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ItemsViews: View {
    @StateObject var viewModel: ItemsViewsViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        // users/<id>/todos/<entries>
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ItemsViewsViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .background(Color(red: 0.65, green: 0.84, blue: 0.66, opacity: 0.3))
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ItemsViews(userId: "YlUbjLs3BjaQcMViPQKeaENMkiV2")
}
