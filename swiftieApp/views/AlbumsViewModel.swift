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
    
    init() {
        albums = loadAlbums()
    }
}
