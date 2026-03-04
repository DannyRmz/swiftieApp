//
//  AlbumsView.swift
//  swiftieApp
//
//  Created by Daniel Ramirez on 03/03/26.
//

import SwiftUI

struct AlbumsView: View {
    
    @StateObject private var viewModel = AlbumsViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.albums) { album in
                NavigationLink(destination: AlbumDetailView(album: album)) {
                    Text(album.name)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AlbumsView()
            .navigationTitle("Albums")
    }
}
