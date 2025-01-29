//
//  MovieItem.swift
//  DesafioM2Y
//
//  Created by Diego Janjardi Briz Llopis on 29/01/25.
//
import SwiftUI

struct MovieItem: View {
    
    let movie: Movie
    
    var body: some View {
        ZStack {
            Color.black
                .frame(maxWidth: .infinity)
                .frame(height: 120)
            
            HStack(spacing: 15) {
                Image(movie.posterPath)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 75, height: 100)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(movie.title)
                        .fontWeight(.bold)
                        .font(.headline)
                    HStack {
                        Text(movie.releaseDate)
                        Text(movie.genreIds.first ?? "")
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
                
                Spacer()
            }
            .preferredColorScheme(.dark)
            .padding(.horizontal, 10)
            
        }
    }
}

#Preview {
    MovieItem(
        movie: Movie(
            title: "Armor wars",
            releaseDate: "2018",
            posterPath: "johnny_2",
            genreIds: ["Aventura, Ação"]
        )
    )
}
