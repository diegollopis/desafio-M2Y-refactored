//
//  HomeVM.swift
//  DesafioM2Y
//
//  Created by Diego Janjardi Briz Llopis on 29/01/25.
//

import Foundation
import Alamofire

class HomeVM: ObservableObject {
    
    let apiKey: String = "e5eb01e1a7cf82d8d5d574e34f2e58ff"
    let url = "https://api.themoviedb.org/3/movie/24428/similar?api_key=e5eb01e1a7cf82d8d5d574e34f2e58ff&language=en-US&page=1"
    
    let movieId: String = "24428"
    let movieUrl: String = "https://api.themoviedb.org/3/movie/24428?api_key=e5eb01e1a7cf82d8d5d574e34f2e58ff&language=en-US"
  
    @Published var movieList: [Movie] = []
    @Published var movieHeader: MovieHeader = MovieHeader(title: "", voteAverage: 0, voteCount: 0, posterPath: "")
    
    func fetch() {
        fetchMovieHeader()
        fetchMoviesList()
    }
    
    private func fetchMoviesList() {
        AF.request(url)
            .responseDecodable(of: MoviesList.self) { response in
                switch response.result {
                case .success(let data):
                    self.movieList = data.results
                    print(data.results)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    private func fetchMovieHeader() {
        AF.request(movieUrl)
            .responseDecodable(of: MovieHeader.self) { response in
                switch response.result {
                case .success(let data):
                    self.movieHeader = data
                case .failure(let error):
                    print(error)
                }
            }
    }
}
