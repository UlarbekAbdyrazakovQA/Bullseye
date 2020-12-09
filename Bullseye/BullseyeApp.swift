//
//  BullseyeApp.swift
//  Bullseye
//
//  Created by Ularbek Abdyrazakov on 02.10.2020.
//

import SwiftUI

@main
struct BullseyeApp: App {
    var body: some Scene {
        
        WindowGroup {
            NavigationView{
                ContentView()
                
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
