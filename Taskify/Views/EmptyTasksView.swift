//
//  EmptyTasksView.swift
//  Taskify
//
//  Created by Rian Harshaw on 10/2/23.
//

import SwiftUI

struct EmptyTasksView: View {
  @ObservedObject var vm: Store
  
    var body: some View {
      if vm.tasks.isEmpty {
        ContentUnavailableView(label: {
          Label("Your Task List Is Empty", systemImage: "list.bullet.clipboard")
        }, description: {
          Text("Start adding tasks")
        }, actions: {
          Button(action: {
            vm.addingNewTask.toggle()
          }) {
            Text("Add New Task")
          }
        })
      }
    }
}

#Preview {
    EmptyTasksView(vm: Store())
}
