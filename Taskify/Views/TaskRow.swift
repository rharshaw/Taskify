//
//  TaskRow.swift
//  Taskify
//
//  Created by Rian Harshaw on 10/2/23.
//

import SwiftUI

struct TaskRow: View {
  @ObservedObject var vm: Store
  
  let task: Task
  
  var body: some View {
    VStack(spacing: 20) {
      HStack {
        Text(task.title)
          .bold()
          .font(.title3)
        Spacer()
        Image(systemName: task.isCompleted ? "checkmark.square.fill" : "square")
          .foregroundStyle(task.isCompleted ? .green : .red)
          .bold()
          .onTapGesture {
            vm.toggleCompletion(task: task)
          }
      }
      Divider()
    }
    .padding(.horizontal)
  }
}

#Preview {
  TaskRow(vm: Store(), task: Task.mock)
}
