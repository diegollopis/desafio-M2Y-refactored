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
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Jumbotron(vm: vm, safeArea: safeArea, size: size)
                ListMovies(vm: vm)
            }
        }
        .coordinateSpace(name: "SCROLL")
        .onAppear { vm.fetch() }
    }
}

#Preview {
    MainView()
}
