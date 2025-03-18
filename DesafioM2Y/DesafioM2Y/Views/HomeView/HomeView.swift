//
//  Home.swift
//  DesafioM2Y
//
//  Created by Diego Janjardi Briz Llopis on 28/01/25.
//

import SwiftUI

struct HomeView: View {
    
    var safeArea: EdgeInsets
    var size: CGSize
    
    @ObservedObject var vm = HomeVM()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    Jumbotron(vm: vm, safeArea: safeArea, size: size)
                    ForEach(vm.movieList, id: \.self) { movie in
                        NavigationLink(value: movie) {
                            MovieItem(movie: movie)
                        }
                    }
                }
                .navigationDestination(for: Movie.self) { movie in
                    Overview(movie: movie, size: CGFloat(size.height))
                }
            }
            .coordinateSpace(name: "SCROLL")
            .onAppear { vm.fetch() }
        }
    }
}

#Preview {
    MainView()
}
