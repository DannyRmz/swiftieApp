//
//  loadAlbums.swift
//  swiftieApp
//
//  Created by Daniel Ramirez on 05/03/26.
//

import Foundation

func loadAlbums() -> [Album] {
    guard let url = Bundle.main.url(forResource: "taylorSwiftAlbums", withExtension: "json") else {
        fatalError("JSON not found")
    }
    
    do {
        let data = try Data(contentsOf: url)
        let decoded = try JSONDecoder().decode(AlbumsResponse.self, from: data)
        return decoded.albums
    } catch {
        print(error)
        return []
    }
}
