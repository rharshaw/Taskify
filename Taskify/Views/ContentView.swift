//
//  ContentView.swift
//  Taskify
//
//  Created by Rian Harshaw on 10/2/23.
//

import SwiftUI

struct ContentView: View {
  
  //Initializing my Store object here. 
  @StateObject private var vm = Store()

  var body: some View {
    NavigationStack {
      ScrollView {
        ForEach(vm.tasks) { task in
          NavigationLink(value: task) {
            TaskRow(vm: vm, task: task)
              .padding(.top)
          }
        }
      }
      .navigationTitle("Taskify")
      .sheet(isPresented: $vm.addingNewTask) { NewTask(vm: vm) }
      
      .toolbar {
        if !vm.tasks.isEmpty {
          ToolbarItem(placement: .topBarTrailing) {
            Button("New Task") {
              vm.addingNewTask.toggle()
            }
          }
        }
      }
      .navigationDestination(for: Task.self) { task in
        TaskDetail(vm: vm, task: task)
      }
    }
    .overlay {
      EmptyTasksView(vm: vm)
    }
  }
  
}

#Preview {
  ContentView()
}
