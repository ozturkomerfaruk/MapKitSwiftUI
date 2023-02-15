//
//  SwiftUIMapApp.swift
//  SwiftUIMapApp
//
//  Created by Ömer Faruk Öztürk on 15.02.2023.
//

import SwiftUI

@main
struct SwiftUIMapAppApp: App {
    @StateObject var viewModel: LocationsViewModel = LocationsViewModel()

    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(viewModel)
        }
    }
}
