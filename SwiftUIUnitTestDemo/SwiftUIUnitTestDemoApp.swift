//
//  SwiftUIUnitTestDemoApp.swift
//  SwiftUIUnitTestDemo
//
//  Created by ymnt on 4/13/21.
//

import SwiftUI

@main
struct SwiftUIUnitTestDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: MyAccountViewModel(with: MockEntities.positiveEntity))
        }
    }
}
