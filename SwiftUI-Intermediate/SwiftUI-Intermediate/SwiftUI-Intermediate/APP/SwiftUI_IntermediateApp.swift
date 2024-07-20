//
//  SwiftUI_IntermediateApp.swift
//  SwiftUI-Intermediate
//
//  Created by 이윤지 on 7/20/24.
//

import SwiftUI

@main
struct SwiftUI_IntermediateApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
