//
//  ContentView.swift
//  DesafioM2Y
//
//  Created by Diego Janjardi Briz Llopis on 28/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader {
            let safeArea = $0.safeAreaInsets
            let size = $0.size
            
            Home(safeArea: safeArea, size: size)
                .ignoresSafeArea(.container, edges: .top)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
