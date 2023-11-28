//
//  DashboardView.swift
//  todo
//
//  Created by Frank on 11/27/23.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var todoListViewModel: TodoListViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(todoListViewModel.todos.indices, id: \.self) { index in
                    NavigationLink(destination: TodoDetailView(todo: $todoListViewModel.todos[index], onSave: todoListViewModel.update)) {
                        VStack(alignment: .leading) {
                            Text(todoListViewModel.todos[index].title).font(.headline)
                            Text(todoListViewModel.todos[index].description).font(.subheadline)
                        }
                    }
                }
                .onDelete(perform: todoListViewModel.delete)
            }
            .navigationTitle("Todos")
            .navigationBarItems(trailing: Button(action: todoListViewModel.addTodo) {
                Image(systemName: "plus")
            })
        }
    }
}
