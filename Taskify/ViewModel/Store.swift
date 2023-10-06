//
//  Store.swift
//  Taskify
//
//  Created by Rian Harshaw on 10/2/23.
//

import Foundation

@MainActor // <--- You'll learn more about that in a later week. 
final class Store: ObservableObject {
  @Published var tasks = [Task]()
  
  //Fun fact, you can tie all inputs and binding values from views to published variables wihtin your view model! To not confuse anyone completely, I only tied my bindings for showing the sheet and triggering an update to the properties below. Give a little bit of both worlds. Ya'kno, cause I'm so nice.
  @Published var addingNewTask = false
  @Published var updatingTask = false
  
  init() {
  // I commented out the line below just because I like the empty view screen. If you wanna load the 5, by all means....uncomment
///    self.tasks = Task.mockTasks
  }
  
  func addTask(title: String, notes: String) {
    tasks.append(Task(title: title, notes: notes))
  }
 
  
  //MARK: There are other ways to do this. This is just what I did.
  
  func toggleCompletion(task: Task) {
    /// Grab the index of the ^^ task that's passed in by comparing the id value.                vvv  Then go to the array of tasks (line12), pluck out the one we want, and then change the status of the completion.
    if let index = tasks.firstIndex(where: { $0.id == task.id }) { tasks[index].isCompleted.toggle() }
  }
  

  func updateTask(task: Task, title: String, notes: String) {
    /// Doing the same as above. Looking at the task that's passed in and locating it in the array (line 12).
    if let index = tasks.firstIndex(where: { $0.id == task.id }) {
     
      /// Doing a guard to ensure that the title is not empty. If it is, we're exiting the function immediately.  WE DON'T WANT EMPTY TASK TITLES THIS WAY. 😤
      guard !title.isEmpty else {
        updatingTask.toggle()
        return
      }
      /// This logic will make sure that the notes or title will be changed only if it does not match with whatever is currently there.
      if title != task.title || notes != task.notes {
        self.tasks[index].title = title
        self.tasks[index].notes = notes
      }
    }
    ///Switching off the updating (edit) toggle
    updatingTask.toggle()
  }
  
  func deleteTask(task: Task) {
    if let index = tasks.firstIndex(where: { $0.id == task.id }) { tasks.remove(at: index) }
  }
}
