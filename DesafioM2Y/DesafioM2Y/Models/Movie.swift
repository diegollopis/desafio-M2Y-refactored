//
//  Movie.swift
//  DesafioM2Y
//
//  Created by Diego Janjardi Briz Llopis on 29/01/25.
//

//struct APIMoviesList: Codable {
//    
//    let results: [Results]
//}

struct Movie: Codable, Hashable {
    
    let title: String
    let releaseDate: String
    let posterPath: String
    let genreIds: [String]
}

let mockList = [
    Movie(
        title: "Armor wars",
        releaseDate: "2018",
        posterPath: "johnny_2",
        genreIds: ["Aventura, Ação"]
    ),
    Movie(
        title: "Armor wars",
        releaseDate: "2018",
        posterPath: "johnny_2",
        genreIds: ["Aventura, Ação"]
    ),
    Movie(
        title: "Armor wars",
        releaseDate: "2018",
        posterPath: "johnny_2",
        genreIds: ["Aventura, Ação"]
    ),
    Movie(
        title: "Armor wars",
        releaseDate: "2018",
        posterPath: "johnny_2",
        genreIds: ["Aventura, Ação"]
    ),
    Movie(
        title: "Armor wars",
        releaseDate: "2018",
        posterPath: "johnny_2",
        genreIds: ["Aventura, Ação"]
    ),
    Movie(
        title: "Armor wars",
        releaseDate: "2018",
        posterPath: "johnny_2",
        genreIds: ["Aventura, Ação"]
    ),
    Movie(
        title: "Armor wars",
        releaseDate: "2018",
        posterPath: "johnny_2",
        genreIds: ["Aventura, Ação"]
    ),
    Movie(
        title: "Armor wars",
        releaseDate: "2018",
        posterPath: "johnny_2",
        genreIds: ["Aventura, Ação"]
    ),
    Movie(
        title: "Armor wars",
        releaseDate: "2018",
        posterPath: "johnny_2",
        genreIds: ["Aventura, Ação"]
    ),
    Movie(
        title: "Armor wars",
        releaseDate: "2018",
        posterPath: "johnny_2",
        genreIds: ["Aventura, Ação"]
    ),
    Movie(
        title: "Armor wars",
        releaseDate: "2018",
        posterPath: "johnny_2",
        genreIds: ["Aventura, Ação"]
    ),
]

