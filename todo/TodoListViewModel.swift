//
//  TodoListViewModel.swift
//  todo
//
//  Created by Frank on 11/27/23.
//

import Foundation

class TodoListViewModel: ObservableObject {
    @Published var todos: [Todo] = []

    func addTodo() {
        let newTodo = Todo(title: "New Todo", description: "", deadline: Date(), priority: 1)
        todos.append(newTodo)
    }

    func update(todo: Todo) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index] = todo
        }
    }

    func delete(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
}
