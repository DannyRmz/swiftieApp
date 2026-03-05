//
//  SongsDetailView.swift
//  swiftieApp
//
//  Created by Daniel Ramirez on 05/03/26.
//

import SwiftUI

struct SongsDetailView: View {
    
    let song: Song
    let album: Album
    
    var body: some View {
        VStack {
            HStack {
                Image(album.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 2)
                
                Text("\(song.name)")
            }
            
            Text("Lyrics coming soon...")
        }
    }
}

#Preview {
    let previewSong = Song(
        id: 1,
        trackNumber: 1,
        name: "State of Grace",
        duration: "4:55",
        cover: nil
    )
    
    let previewAlbum = Album(
        id: 1,
        name: "Red",
        year: "2012",
        cover: "red",
        songs: [previewSong]
    )
    
    SongsDetailView(song: previewSong, album: previewAlbum)
}
