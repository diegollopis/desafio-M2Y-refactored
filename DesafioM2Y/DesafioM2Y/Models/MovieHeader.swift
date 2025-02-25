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
        if voteCount > 1000 {
            let result = Double(voteCount) / 1000
            return String(format: "%.1f", result) + " K Curtidas"
        } else {
            return "\(voteCount) Curtidas"
        }
    }
    
    var viewsFormatted: String {
        if popularity > 100 {
            let result = Double(popularity)
            return String(format: "%.1f", result) + "K Views"
        } else {
            return "\(popularity) Views"
        }
    }
}
