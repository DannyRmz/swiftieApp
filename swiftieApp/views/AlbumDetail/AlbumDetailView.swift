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
                    HStack {
                        Image(album.cover)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
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
                        
                        HStack {
                            
                            Image(song.cover ?? album.cover)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                            
                            VStack(alignment: .leading) {
                                Text(song.name)
                                Text(song.duration)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            
                            Spacer()
                            
                            Text("\(song.trackNumber)")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle(album.name)
        }
}

#Preview {
    AlbumDetailView(album: Album.init(id: 1, name: "test", year: "2020", cover: "", songs: []))
}
