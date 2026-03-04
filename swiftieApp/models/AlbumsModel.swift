//
//  AlbumsModel.swift
//  swiftieApp
//
//  Created by Daniel Ramirez on 03/03/26.
//

import Foundation

struct Album: Identifiable, Codable {
    var id = UUID()
    var name: String
    var year: String
}


