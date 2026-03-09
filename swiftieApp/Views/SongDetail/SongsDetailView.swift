//
//  SongsDetailView.swift
//  swiftieApp
//
//  Created by Daniel Ramirez on 05/03/26.
//

import SwiftUI

struct SongsDetailView: View {
    
    @StateObject var viewModel: SongsDetailViewModel
    
    var body: some View {
        List {
            Section {
                VStack(alignment: .leading) {
                    HStack(spacing: 16) {
                        Image(viewModel.album.cover)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .shadow(radius: 2)
                        
                        VStack(alignment: .leading) {
                            Text("\(viewModel.song.name)")
                                .font(.title2)
                                .bold()
                            Text(viewModel.song.artists?.joined(separator: ", ") ?? "")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            
            Section("Lyrics") {
                Text(viewModel.lyrics)
                    .padding()
            }
        }
        .navigationTitle("\(viewModel.song.name)")
    }
}

#Preview {
    
}
