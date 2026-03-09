//
//  AlbumsResponse.swift
//  swiftieApp
//
//  Created by Daniel Ramirez on 05/03/26.
//

struct AlbumsResponse: Codable {
    let albums: [Album]
}

struct Album: Codable, Identifiable {
    let id: Int
    let name: String
    let year: String
    let cover: String
    let artist: String
    let songs: [Song]
}

struct Song: Codable, Identifiable {
    let id: Int
    let trackNumber: Int
    let name: String
    let cover: String?
    let lyricsFile: String?
    let artists: [String]?
}
