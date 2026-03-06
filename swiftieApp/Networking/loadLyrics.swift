//
//  loadLyrics.swift
//  swiftieApp
//
//  Created by Daniel Ramirez on 05/03/26.
//

import Foundation

func loadLyrics(fileName: String) -> String {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: "txt") else {
        return ""
    }
    
    return (try? String(contentsOf: url, encoding: .utf8)) ?? ""
}

