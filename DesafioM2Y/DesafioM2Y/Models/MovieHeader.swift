//
//  MovieHeader.swift
//  DesafioM2Y
//
//  Created by Diego Janjardi Briz Llopis on 30/01/25.

struct MovieHeader: Decodable {
    let title: String
    let popularity: Float
    let voteAverage: Double
    let voteCount: Int
    let posterPath: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case popularity
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case posterPath = "poster_path"
    }
    
    var posterPathFormatted: String {
        let baseUrl = "https://image.tmdb.org/t/p/original/"
        return "\(baseUrl)\(posterPath)"
    }
    
    var likesFormatted: String {
        "\(voteCount) Curtidas"
    }
    
    var viewsFormatted: String {
        "\(popularity) Visualizações"
    }
}
