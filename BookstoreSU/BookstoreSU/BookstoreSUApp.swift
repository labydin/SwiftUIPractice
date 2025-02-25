//
//  BookstoreSUApp.swift
//  BookstoreSU
//
//  Created by 박준영 on 11/25/24.
//

import SwiftUI

@main
struct BookstoreSUApp: App {
    
    let persistenceController = CoreDataViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environment(\.managedObjectContext,
                              persistenceController.container.viewContext)
                //.modelContainer(for: [RecentBooks.self])
        }
    }
}
