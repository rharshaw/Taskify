//
//  NewTask.swift
//  Taskify
//
//  Created by Rian Harshaw on 10/2/23.
//

import SwiftUI

struct NewTask: View {
  @State private var taskTitle = ""
  @State private var taskNotes = ""
  
  @ObservedObject var vm: Store
  
    var body: some View {
      NavigationStack {
        List {
          Section("Task Title") {
            TextField("Title", text: $taskTitle)
          }
          Section("Notes") {
            TextField("Notes", text: $taskNotes, axis: .vertical)
              .lineLimit(5...)
          }
        }
        .navigationTitle("Adding New Task")
        .navigationBarTitleDisplayMode(.inline)
        
        .toolbar {
          ToolbarItem(placement: .topBarLeading) {
            Button("Cancel") {
              vm.addingNewTask.toggle()
            }
          }
          
          ToolbarItem(placement: .topBarTrailing) {
            Button("Add") {
              vm.addTask(title: taskTitle, notes: taskNotes)
              vm.addingNewTask.toggle()
            }
            .disabled(taskTitle.isEmpty)
          }
        }
      }
    }
}

#Preview {
  NewTask(vm: Store())
}
