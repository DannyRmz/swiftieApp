//
//  AlbumsView.swift
//  swiftieApp
//
//  Created by Daniel Ramirez on 03/03/26.
//

import SwiftUI

struct AlbumsView: View {
    
    @ObservedObject var viewModel = AlbumsViewModel()
    
    var body: some View {
        List(viewModel.albums) { album in
            NavigationLink(destination: AlbumDetailView(album: album)) {
                HStack(spacing: 16) {
                    Image(album.cover)
                        .resizable()
                        .frame(width: 55, height: 55)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(radius: 2)
                    
                    VStack(alignment: .leading) {
                        Text(album.name)
                            .font(.headline)
                        
                        Text("\(album.year)")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
            AlbumsView(viewModel: AlbumsViewModel())
        }
}
