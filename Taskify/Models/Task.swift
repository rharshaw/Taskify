//
//  Task.swift
//  Taskify
//
//  Created by Rian Harshaw on 10/2/23.
//

import Foundation

struct Task: Hashable, Identifiable {
  let id = UUID()
  var title: String
  var isCompleted: Bool = false
  var notes: String
}

extension Task {
  static let mock = Task(title: "Buy Groceries", isCompleted: true, notes: "Coffee, Eggs, Milk, More Coffee, Creamer, Cheese, Papaya, Hot Sauce, Ribeye Steaks, Spaghetti")
  static let mock2 = Task(title: "Annoy Wife", isCompleted: false, notes: "Use last bit of toilet paper and not go exchange for a new roll.")
  static let mock3 = Task(title: "Pick Kid Up From School", isCompleted: false, notes: "Get him a happy meal.")
  static let mock4 = Task(title: "Make Dinner", isCompleted: false, notes: "By making dinner, I mean order a pizza. More time to code.")
  static let mock5 = Task(title: "Grade Week 5 Homework", isCompleted: false, notes: "Time to see some to-do apps!")
  static let mockTasks = [mock, mock2, mock3, mock4, mock5]
}
