//
//  HomeService.swift
//  DesafioM2Y
//
//  Created by Diego Janjardi Briz Llopis on 30/01/25.

import RxSwift

class HomeService {
    
    private let networkManager = NetworkManager.shared
    
    let apiKey: String = "e5eb01e1a7cf82d8d5d574e34f2e58ff"
    
    func getHeader() -> Single<MovieHeader> {
        let url = "https://api.themoviedb.org/3/movie/24428?api_key=e5eb01e1a7cf82d8d5d574e34f2e58ff&language=en-US"
        return networkManager.request(url)
    }
    
    func getMoviesList() -> Single<MoviesList> {
        let url = "https://api.themoviedb.org/3/movie/24428/similar?api_key=e5eb01e1a7cf82d8d5d574e34f2e58ff&language=en-US&page=1"
        return networkManager.request(url)
    }
}
