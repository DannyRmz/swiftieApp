//
//  HomeView.swift
//  swiftieApp
//
//  Created by Daniel Ramirez on 03/03/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.orange.opacity(0.1)
                .ignoresSafeArea(.all)
                
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 10) {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.green)
                                .containerRelativeFrame(.horizontal, count: 1, spacing: 15)
                                .scrollTransition { content, phase in
                                    content
                                        .opacity(phase.isIdentity ? 1.0 : 0.5)
                                        .scaleEffect(phase.isIdentity ? 1.0 : 0.8)
                                }
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.yellow)
                                .containerRelativeFrame(.horizontal, count: 1, spacing: 15)
                                .scrollTransition { content, phase in
                                    content
                                        .opacity(phase.isIdentity ? 1.0 : 0.5)
                                        .scaleEffect(phase.isIdentity ? 1.0 : 0.8)
                                }
                            
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.purple)
                                .containerRelativeFrame(.horizontal, count: 1, spacing: 15)
                                .scrollTransition { content, phase in
                                    content
                                        .opacity(phase.isIdentity ? 1.0 : 0.5)
                                        .scaleEffect(phase.isIdentity ? 1.0 : 0.8)
                                }
                            
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.red)
                                .containerRelativeFrame(.horizontal, count: 1, spacing: 15)
                                .scrollTransition { content, phase in
                                    content
                                        .opacity(phase.isIdentity ? 1.0 : 0.5)
                                        .scaleEffect(phase.isIdentity ? 1.0 : 0.8)
                                }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .frame(height: 200)
                    //.padding()
                    .scrollIndicators(.hidden)
                    
                    VStack(alignment: .leading) {
                        Text("News")
                            .font(.title)
                            .bold()
                        
                        Text("New milestone achieved on Spotify!")
                            .font(.subheadline)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
            .navigationTitle("Home")
    }
}
