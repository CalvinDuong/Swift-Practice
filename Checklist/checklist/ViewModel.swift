//
//  ViewModel.swift
//  checklist
//
//  Created by Andy Huang on 7/30/23.
//

import Foundation

class ViewModel: ObservableObject {
    // TODO: Add class attributes
    @Published var inProgressList = ["Eat", "Sleep"]
    @Published var completedList = [String]()
    @Published var todo: String = ""
    
    
    func add() -> Void {
        // TODO: Implement
        inProgressList.append(todo)
    }
    
    func swapToInProgress(task: String) -> Void {
        // TODO: Implement
        if let index = completedList.firstIndex(of: task) {
            completedList.remove(at: index)
            inProgressList.append(task)
        }
    }
    
    func swapToComplete(task: String) -> Void {
        // TODO: Implement
        if let index = inProgressList.firstIndex(of: task) {
            inProgressList.remove(at: index)
            completedList.append(task)
        }
    }
}
    
