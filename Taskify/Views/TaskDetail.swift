//
//  TaskDetail.swift
//  Taskify
//
//  Created by Rian Harshaw on 10/2/23.
//

import SwiftUI

struct TaskDetail: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm: Store
    
    @State private var title = ""
    @State private var notes = ""
    @State var task: Task
    
    var body: some View {
        
        List {
            Section("Title") {
                TextField("Title", text: $title, axis: .vertical)
                    .lineLimit(0...)
                    .disabled(!vm.updatingTask)
            }
            Section("Notes") {
                TextField("Notes", text: $notes, axis: .vertical)
                    .lineLimit(5...)
                    .disabled(!vm.updatingTask)
            }
            
            Section {
                Button(task.isCompleted ? "Mark Incomplete" : "Mark Complete") {
                    task.isCompleted.toggle()
                    vm.toggleCompletion(task: task)
                }
            }
            
            if vm.updatingTask {
                Button("Cancel") {
                    vm.updatingTask.toggle()
                }
                Button("Delete", role: .destructive) {
                    dismiss()
                    vm.deleteTask(task: task)
                    vm.updatingTask.toggle()
                }
                
            }
        }
        .navigationTitle(task.title)
        .navigationBarTitleDisplayMode(.inline)
        
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                if vm.updatingTask {
                    Button("Update") {
                        vm.updateTask(task: task, title: title, notes: notes)
                        
                    }
                } else {
                    Button("Edit") {
                        withAnimation {
                            vm.updatingTask = true
                        }
                    }
                }
            }
        }
        .onAppear {
            title = task.title
            notes = task.notes
        }
    }
}

#Preview {
    TaskDetail(vm: Store(), task: Task.mock)
}
