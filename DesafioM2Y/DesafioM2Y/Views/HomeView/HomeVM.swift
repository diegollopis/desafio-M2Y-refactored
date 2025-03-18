//
//  HomeVM.swift
//  DesafioM2Y
//
//  Created by Diego Janjardi Briz Llopis on 29/01/25.
//

import SwiftUI
import Alamofire
import RxSwift

class HomeVM: ObservableObject {
    private let disposeBag = DisposeBag()
    
    private let service = HomeService()
    @Published var movieList: [Movie] = []
    @Published var movieHeader: MovieHeader = MovieHeader(
        title: "",
        popularity: 0.0,
        voteAverage: 0,
        voteCount: 0,
        posterPath: "")
    
    func fetch() {
        fetchMovieHeader()
        fetchMoviesList()
    }
    
    private func fetchMovieHeader() {
        service.getHeader()
            .subscribe(onSuccess: { response in
                self.movieHeader = response
                print(response)
            }, onFailure: { error in
                print(error)
            })
            .disposed(by: disposeBag)
    }
    
    private func fetchMoviesList() {
        service.getMoviesList()
            .subscribe(onSuccess: { response in
                self.movieList = response.results
                print(response)
            }, onFailure: { error in
                print(error)
            })
            .disposed(by: disposeBag)
    }
}
