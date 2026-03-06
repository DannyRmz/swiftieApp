//
//  AlbumsViewModel.swift
//  swiftieApp
//
//  Created by Daniel Ramirez on 03/03/26.
//

import Foundation
import Combine

final class AlbumsViewModel: ObservableObject {
    @Published var albums: [Album] = []
    @Published var searchText: String = ""
    
    init() {
        albums = loadAlbums()
    }
    
    var allSongs: [Song] {
        albums.flatMap { $0.songs }
    }
    
    var filteredSongs: [Song] {
        
        if searchText.isEmpty {
            return []
        }
        
        return allSongs.filter { song in
            
            guard let file = song.lyricsFile else { return false }
            
            let lyrics = loadLyrics(fileName: file)
            
            return lyrics.localizedCaseInsensitiveContains(searchText)
        }
    }
}
