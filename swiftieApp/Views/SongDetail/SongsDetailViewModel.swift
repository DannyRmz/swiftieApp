//
//  SongsDetailViewModel.swift
//  swiftieApp
//
//  Created by Daniel Ramirez on 05/03/26.
//

import Foundation
import Combine

final class SongsDetailViewModel: ObservableObject {
    
    let song: Song
    let album: Album
    
    @Published var lyrics: String = ""
    
    init(song: Song, album: Album) {
        self.song = song
        self.album = album
        loadLyrics()
    }
    
    private func loadLyrics() {
        guard let file = song.lyricsFile else {
            lyrics = "Lyrics not available"
            return
        }
        
        lyrics = swiftieApp.loadLyrics(fileName: file)
    }
}
