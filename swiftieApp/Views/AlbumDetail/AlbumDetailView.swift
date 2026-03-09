//
//  AlbumDetailView.swift
//  swiftieApp
//
//  Created by Daniel Ramirez on 03/03/26.
//

import SwiftUI

struct AlbumDetailView: View {
    
    let album: Album
        
        var body: some View {
            List {
                Section {
                    HStack(spacing: 16) {
                        Image(album.cover)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .shadow(radius: 2)
                        
                        VStack(alignment: .leading) {
                            Text(album.name)
                                .font(.title2)
                                .bold()
                            
                            Text("\(album.year)")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                
                Section("Songs") {
                    ForEach(album.songs) { song in
                        NavigationLink(destination: SongsDetailView(viewModel: SongsDetailViewModel(song: song, album: album))) {
                            HStack(spacing: 16) {
                                
                                Text("\(song.trackNumber)")
                                    .foregroundStyle(.secondary)
                                                            
                                Image(song.cover ?? album.cover)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .shadow(radius: 2)
                                
                                VStack(alignment: .leading) {
                                    Text(song.name)
                                    Text(song.artists?.joined(separator: ", ") ?? "")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)

                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(album.name)
        }
}

#Preview {
    NavigationStack {
        AlbumDetailView(album: Album.init(id: 1, name: "folklore", year: "2020", cover: "folklore", artist: "Taylor Swift", songs: [ Song.init(id: 1, trackNumber: 1, name: "the 1", cover: nil, lyricsFile: "timMcgraw", artists: [])]))
    }
}
