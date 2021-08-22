//
//  TaskDataSource.swift
//  MVCPractice_taskApp
//
//  Created by Arai Kousuke on 2021/08/22.
//

import Foundation

 final class TaskDataSource: NSObject {
    
    private var tasks = [Task]()
    
    func loadData() {
        let userDefaults = UserDefaults.standard
        let taskDictionaries = userDefaults.object(forKey: "tasks") as? [[String: Any]]
        guard let t = taskDictionaries else { return }
        for dic in t {
            let task = Task(from: dic)
            tasks.append(task)
        }
    }
    
    func save(task: Task) {
        tasks.append(task)
        
        var taskDictionaries = [[String: Any]]()
        for t in tasks {
            let taskDictionary: [String: Any] = ["text": t.text,
                                                 "deadline": t.deadLine]
            taskDictionaries.append(taskDictionary)
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(taskDictionaries, forKey: "tasks")
        userDefaults.synchronize()
    }
    
    func count() ->Int {
        return tasks.count
    }

    func data(at index: Int) ->Task? {
        if (tasks.count > index) {
            return tasks[index]
        }
        return nil
    }
}
