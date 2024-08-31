//
//  CryptoSwiftUIApp.swift
//  CryptoSwiftUI
//
//  Created by Anshu.Vij on 26/08/24.
//

import SwiftUI

@main
struct CryptoSwiftUIApp: App {
    @StateObject private var vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .toolbar(.hidden)
            }
            .environmentObject(vm)
        }
    }
}
