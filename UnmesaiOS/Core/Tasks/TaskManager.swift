//
//  TaskManager.swift
//  UnmesaiOS
//
//  Created by Ishan Gupta on 31/12/25.
//

import Foundation

@MainActor
final class TaskManager: ObservableObject {
    @Published var todayTasks: [String] = []
    
    func setTasks(_ tasks: [String]) {
        todayTasks = tasks.filter { !$0.isEmpty }
        UserDefaults.standard.set(tasks, forKey: "todayTasks")
    }
    
    func loadTasks() {
        if let tasks = UserDefaults.standard.array(forKey: "todayTasks") as? [String] {
            todayTasks = tasks.filter { !$0.isEmpty }
        }
    }
}

