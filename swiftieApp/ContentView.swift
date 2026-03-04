//
//  ContentView.swift
//  swiftieApp
//
//  Created by Daniel Ramirez on 03/03/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house.fill") {
                NavigationStack {
                    HomeView()
                        .navigationTitle("Home")

                }
            }
            
            Tab("Albums", systemImage: "play.square.stack.fill") {
                NavigationStack {
                    AlbumsView()
                        .navigationTitle("Albums")

                }
            }
        }
    }
}

#Preview {
    ContentView()
}
