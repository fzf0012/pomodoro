//
//  DashboardView.swift
//  todo
//
//  Created by Frank on 11/27/23.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var todoListViewModel: TodoListViewModel
    @State private var selectedTodoID: String?

    var body: some View {
        NavigationView {
            List {
                ForEach(todoListViewModel.todos) { todo in
                    NavigationLink(
                        destination: TodoDetailView(
                            todo: Binding(
                                get: { todo },
                                set: { self.update(todo: $0) }
                            ),
                            onSave: { self.update(todo: $0) },
                            onDelete: { self.delete(todo: todo) },
                            isNewTodo: todoListViewModel.isNewTodo(todo)
                        ),
                        tag: todo.id,
                        selection: $selectedTodoID
                    ) {
                        VStack(alignment: .leading) {
                            Text(todo.title).font(.headline)
                            Text(todo.description).font(.subheadline)
                        }
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("Todos")
            .navigationBarItems(trailing: Button(action: addTodo) {
                Image(systemName: "plus")
            })
        }
    }

    private func update(todo: Todo) {
        todoListViewModel.update(todo: todo)
    }

    private func delete(todo: Todo) {
        if let index = todoListViewModel.todos.firstIndex(where: { $0.id == todo.id }) {
            todoListViewModel.deleteTodo(at: index)
            if selectedTodoID == todo.id {
                selectedTodoID = nil
            }
        }
    }


    private func delete(at offsets: IndexSet) {
        offsets.forEach { index in
            let todo = todoListViewModel.todos[index]
            delete(todo: todo)
        }
    }

    private func addTodo() {
        todoListViewModel.addTodo()
    }
}
