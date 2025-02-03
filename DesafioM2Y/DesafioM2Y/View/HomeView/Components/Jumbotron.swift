//
//  Jumbotron.swift
//  DesafioM2Y
//
//  Created by Diego Janjardi Briz Llopis on 31/01/25.
//
import SwiftUI
import Kingfisher

struct Jumbotron: View {
    
    @State private var isClicked = false
    
    @ObservedObject var vm: HomeVM
    var safeArea: EdgeInsets
    var size: CGSize
    
    var body: some View {
        VStack {
            HeaderArtwork()
            HeaderInfo()
        }
    }
    
    @ViewBuilder
    func HeaderArtwork() -> some View {
        let height = size.height * 0.45
        
        GeometryReader { geometry in
            let size = geometry.size
            let minY = geometry.frame(in: .named("SCROLL")).minY
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            
            KFImage(URL(string: vm.movieHeader.posterPathFormatted))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height + (minY > 0 ? minY : 0))
                .offset(y: minY > 0 ? 0 : minY / 2)
                .clipped()
                .overlay(content: {
                    GradientOverlay(progress: progress)
                })
                .offset(y: -minY)
        }
        .frame(height: height + safeArea.top)
    }
    
    @ViewBuilder
    private func GradientOverlay(progress: CGFloat) -> some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .fill(
                    .linearGradient(colors: [
                        .black.opacity(0 - progress),
                        .black.opacity(0.1 - progress),
                        .black.opacity(0.2 - progress),
                        .black.opacity(0.3 - progress),
                        .black.opacity(0.4 - progress),
                        .black.opacity(0.5 - progress),
                        .black.opacity(0.6 - progress),
                        .black.opacity(0.7 - progress),
                        .black.opacity(0.8 - progress),
                        .black.opacity(0.9 - progress),
                        .black.opacity(1),
                    ], startPoint: .top, endPoint: .bottom)
                )
        }
    }
    
    @ViewBuilder
    private func HeaderInfo() -> some View {
        
        VStack(spacing: 20) {
            HStack {
                Text(vm.movieHeader.title)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .lineLimit(4)
                
                Spacer()
                
                Button {
                    isClicked.toggle()
                } label: {
                    Image(systemName: isClicked ? "heart.fill" : "heart")
                        .foregroundStyle(Color.white)
                        .scaleEffect(1.4)
                }
            }
            
            HStack {
                Icon("heart.fill", vm.movieHeader.likesFormatted)
                Icon("eye", vm.movieHeader.viewsFormatted)
            }
            
        }
        .padding(.horizontal, 15)
        .frame(height: 120)
        .preferredColorScheme(.dark)
    }
    
    fileprivate func Icon(_ icon: String, _ text: String) -> some View {
        return HStack() {
            Image(systemName: icon)
            Text(text)
            Spacer()
        }
        .font(.subheadline)
        .fontWeight(.medium)
    }
}
