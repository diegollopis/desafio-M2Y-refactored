//
//  Home.swift
//  DesafioM2Y
//
//  Created by Diego Janjardi Briz Llopis on 28/01/25.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    
    var safeArea: EdgeInsets
    var size: CGSize
    
    @ObservedObject var vm = HomeVM()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            // MARK: Artwork
            VStack {
                HeaderArtwork()
                MoviesList()
            }
        }
        .coordinateSpace(name: "SCROLL")
    }
    
    @ViewBuilder
    func HeaderArtwork() -> some View {
        let height = size.height * 0.45
        
        GeometryReader { geometry in
            let size = geometry.size
            let minY = geometry.frame(in: .named("SCROLL")).minY
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            
            KFImage(URL(string: vm.movieHeader.posterPathFormatted))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height + (minY > 0 ? minY : 0))
                .offset(y: minY > 0 ? 0 : minY / 2)
                .clipped()
                .overlay(content: {
                    ZStack(alignment: .bottom) {
                        // MARK: Gradient Overlay
                        Rectangle()
                            .fill(
                                .linearGradient(colors: [
                                    .black.opacity(0 - progress),
                                    .black.opacity(0.1 - progress),
                                    .black.opacity(0.2 - progress),
                                    .black.opacity(0.3 - progress),
                                    .black.opacity(0.4 - progress),
                                    .black.opacity(0.5 - progress),
                                    .black.opacity(0.6 - progress),
                                    .black.opacity(0.7 - progress),
                                    .black.opacity(0.8 - progress),
                                    .black.opacity(0.9 - progress),
                                    .black.opacity(1),
                                ], startPoint: .top, endPoint: .bottom)
                            )
                    }
                })
                .offset(y: -minY)
        }
        .frame(height: height + safeArea.top)
        .onAppear {
            vm.fetch()
        }
    }
    
    @ViewBuilder
    func MoviesList() -> some View {
        VStack {
            ForEach(vm.movieList, id: \.self) { movie in
                MovieItem(movie: movie)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    MainView()
}

