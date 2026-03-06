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
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(song.name)
                        
                        Text(song.duration)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        
                        if let snippetText = lyricSnippetText(for: song) {
                            snippetText
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                                .lineLimit(2)
                        }
                    }
                }
            }
        }
        .searchable(text: $viewModel.searchText, prompt: "Search lyrics")
    }
    
    private func lyricSnippetText(for song: Song) -> Text? {
        guard let fileName = song.lyricsFile else { return nil }
        let lyrics = loadLyrics(fileName: fileName)
        guard !lyrics.isEmpty else { return nil }
        
        let cleaned = lyrics.replacingOccurrences(of: "\n", with: " ")
        let query = viewModel.searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !query.isEmpty else {
            return Text(String(cleaned.prefix(80)))
        }
        
        if let match = cleaned.range(of: query, options: [.caseInsensitive, .diacriticInsensitive]) {
            let start = cleaned.index(match.lowerBound, offsetBy: -25, limitedBy: cleaned.startIndex) ?? cleaned.startIndex
            let end = cleaned.index(match.upperBound, offsetBy: 45, limitedBy: cleaned.endIndex) ?? cleaned.endIndex
            
            let lower = match.lowerBound < start ? start : match.lowerBound
            let upper = match.upperBound > end ? end : match.upperBound
            
            let before = String(cleaned[start..<lower])
            let hit = String(cleaned[lower..<upper])
            let after = String(cleaned[upper..<end])
            
            let text = Text(
                "\(start != cleaned.startIndex ? "…" : "")\(before)\(Text(hit).bold().foregroundStyle(.primary))\(after)\(end != cleaned.endIndex ? "…" : "")"
            )
            
            
            return text
        }
        
        return Text(String(cleaned.prefix(80)))
    }
}

#Preview {
    //SearchView(viewModel: <#SearchViewModel#>)
}
