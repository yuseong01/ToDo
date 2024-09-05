//
//  Todo.swift
//  ToDo
//
//  Created by yuseong on 7/28/24.
//

import Foundation
import SwiftData

@Model  //데이터를 관리할거다
class Todo : Identifiable{
    let id: UUID
    var title: String
    var isCompleted: Bool
    var detail: String
    
    init(title: String) {
        self.id = UUID()
        self.title = title
        self.isCompleted = false
        self.detail = ""
    }
}
