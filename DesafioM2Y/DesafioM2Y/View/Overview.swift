//
//  Overview.swift
//  DesafioM2Y
//
//  Created by Diego Janjardi Briz Llopis on 03/02/25.
//

import SwiftUI
import Kingfisher

struct Overview: View {
    
    let movie: Movie
    let size: CGFloat

    var body: some View {
        ScrollView {
            VStack {
                KFImage(URL(string: movie.posterPathFormatted))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: size * 0.6)
                    .clipped()
                Text(movie.overview)
                Spacer()
            }
            //        .toolbar(.hidden)
            .navigationTitle(movie.title)
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    Overview(movie: Movie(
        title: "Os vingadores cabuloso", overview: "",
        releaseDate: "",
        posterPath: ""),
        size: 400
    )
}
