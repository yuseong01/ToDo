//
//  ToDoApp.swift
//  ToDo
//
//  Created by yuseong on 7/28/24.
//

import SwiftUI
import SwiftData

@main
struct ToDoApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Todo.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)    //true로 하면 종료시 데이터 삭제

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
