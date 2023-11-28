//
//  Todo.swift
//  todo
//
//  Created by Frank on 11/27/23.
//

import Foundation

struct Todo: Identifiable, Codable {
    var id: String = UUID().uuidString
    var title: String
    var description: String
    var deadline: Date
    var priority: Int
    var pomodoroSessionsCompleted: Int = 0
}

