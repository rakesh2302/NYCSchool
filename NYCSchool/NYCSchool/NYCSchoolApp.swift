//
//  NYCSchoolApp.swift
//  NYCSchool
//
//  Created by Rakesh Shetty on 11/3/22.
//

import SwiftUI

@main
struct NYCSchoolApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SchoolView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
