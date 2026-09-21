//
//  KimNgoc_MapApp.swift
//  KimNgoc_Map
//
//  Created by SEIU iMac 4 on 21/09/2026.
//

import SwiftUI

@main
struct KimNgoc_MapApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
