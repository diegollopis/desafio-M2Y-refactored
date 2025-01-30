//
//  MovieItem.swift
//  DesafioM2Y
//
//  Created by Diego Janjardi Briz Llopis on 29/01/25.
//
import SwiftUI
import Kingfisher

struct MovieItem: View {
    
    let movie: Movie
    
    var body: some View {
        ZStack {
            Color.black
                .frame(maxWidth: .infinity)
                .frame(height: 120)
            
            HStack(spacing: 15) {
                Poster()
                MovieInfo()
                Spacer()
            }
            .preferredColorScheme(.dark)
        }
    }
    
    @ViewBuilder
    private func Poster() -> some View {
        KFImage(URL(string: movie.posterPathFormatted))
            .resizable()
            .scaledToFill()
            .frame(width: 75, height: 100)
            .clipped()
    }
    
    @ViewBuilder
    private func MovieInfo() -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(movie.title)
                .fontWeight(.bold)
                .font(.headline)
            
            Text(movie.dateFormatted)
                .font(.subheadline)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    MovieItem(
        movie: Movie(
            title: "Armor wars",
            releaseDate: "2018",
            posterPath: "https://image.tmdb.org/t/p/original/5X8kiQQXZKEcUimJGSykwc3dAqA.jpg"
        )
    )
}
