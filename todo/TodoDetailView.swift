//
//  TodoDetailView.swift
//  todo
//
//  Created by Frank on 11/27/23.
//

import SwiftUI

struct TodoDetailView: View {
    @Binding var todo: Todo
    var onSave: (Todo) -> Void
    var onDelete: () -> Void
    var isNewTodo: Bool
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Form {
            TextField("Title", text: $todo.title)
            TextField("Description", text: $todo.description)
            DatePicker("Deadline", selection: $todo.deadline, displayedComponents: .date)
            Picker("Priority", selection: $todo.priority) {
                ForEach(1...3, id: \.self) { priority in
                    Text("\(priority)").tag(priority)
                }
            }
            Button("Save") {
                onSave(todo)
                presentationMode.wrappedValue.dismiss()
                
            }
            
            if !isNewTodo {
                Button("Delete", role: .destructive) {
                    onDelete()
                    presentationMode.wrappedValue.dismiss()
                }
            }
            
            if !isNewTodo {
                Button("Delete", role: .destructive) {
                    onDelete()
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
        .navigationTitle("Todo Details")
    }
}
