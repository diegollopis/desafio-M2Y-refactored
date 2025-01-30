//
//  Movie.swift
//  DesafioM2Y
//
//  Created by Diego Janjardi Briz Llopis on 29/01/25.
//

struct MoviesList: Codable {
    let results: [Movie]
}

struct Movie: Codable, Hashable {
    let title: String
    let releaseDate: String?
    let posterPath: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }
    
    var dateFormatted: String {
        if let releaseDate = releaseDate {
            let date = releaseDate.prefix(4)
            return String(date)
        }
        return ""
    }
    
    var posterPathFormatted: String {
        let baseUrl = "https://image.tmdb.org/t/p/original/"
        return "\(baseUrl)\(posterPath)"
    }
}
