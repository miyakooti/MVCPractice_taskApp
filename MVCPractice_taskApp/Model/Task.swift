//
//  Task.swift
//  MVCPractice_taskApp
//
//  Created by Arai Kousuke on 2021/08/22.
//

import Foundation

class Task {
    
    let text: String
    let deadLine: Date
    
    init(text: String, deadLine: Date) {
        self.text = text
        self.deadLine = deadLine
    }
    
    init(from dictionary: [String: Any]) {
        self.text = dictionary["text"] as! String
        self.deadLine = dictionary["deadLine"] as! Date
    }
    
}
