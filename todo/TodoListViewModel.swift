//
//  TodoListViewModel.swift
//  todo
//
//  Created by Frank on 11/27/23.
//

import Foundation

class TodoListViewModel: ObservableObject {
    @Published var todos: [Todo] = []

    init() {
        loadTodos()
    }

    func addTodo() {
        let newTodo = Todo(title: "New Todo", description: "", deadline: Date(), priority: 1)
        todos.append(newTodo)
        saveTodos()
    }

    func update(todo: Todo) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index] = todo
            saveTodos()
        }
    }

    func deleteTodo(at index: Int) {
        guard index < todos.count else { return }
        todos.remove(at: index)
        saveTodos()
    }
    
    func isNewTodo(_ todo: Todo) -> Bool {
        return !todos.contains(where: { $0.id == todo.id })
    }

    private func loadTodos() {
        // Implement data loading from persistence
    }

    private func saveTodos() {
        // Implement data saving to persistence
    }
}
