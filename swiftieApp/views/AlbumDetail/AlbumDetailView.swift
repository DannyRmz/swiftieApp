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
        
        VStack {
            
            Text("Released in \(album.year)")
                .font(.title3)
        }
        .navigationTitle(album.name)
    }
}

#Preview {
    AlbumDetailView(album: Album(name: "Taylor Swift", year: "2006"))
}
