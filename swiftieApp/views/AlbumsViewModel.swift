//
//  AlbumsViewModel.swift
//  swiftieApp
//
//  Created by Daniel Ramirez on 03/03/26.
//

import Foundation
import Combine

final class AlbumsViewModel: ObservableObject {
    @Published var albums: [Album] = [
        
        Album(name: "Taylor Swift", year: "2006"),
        Album(name: "Fearless", year: "2008"),
        Album(name: "Speak Now", year: "2010")
    ]
}
