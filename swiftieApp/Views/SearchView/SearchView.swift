//
//  SearchView.swift
//  swiftieApp
//
//  Created by Daniel Ramirez on 05/03/26.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel: AlbumsViewModel
    
    var body: some View {
        List(viewModel.filteredSongs) { song in
            
            NavigationLink(destination: LyricsView(song: song)) {
                
                HStack(spacing: 16) {
                    
                    Text("\(song.trackNumber)")
                        .foregroundStyle(.secondary)
                    
                    Image(song.cover ?? "taylorSwift")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    VStack(alignment: .leading) {
                        Text(song.name)
                        
                        Text(song.duration)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .searchable(text: $viewModel.searchText, prompt: "Search lyrics")
    }
}

#Preview {
    //SearchView(viewModel: <#SearchViewModel#>)
}
