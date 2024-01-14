//
//  TopMoviePreview.swift
//  Netflix
//
//  Created by PeterPark on 1/14/24.
//

import SwiftUI

import SwiftUI
import Kingfisher
struct TopMoviePreview: View {
    var movie: Movie
    
    func isCategoryLast(_ cat:String) -> Bool {
        let catCount = movie.categories.count
        
        if let index = movie.categories.firstIndex(of: cat) {
            if index + 1 != catCount {
                return false
            }
        }
        return true
    }
    
    var body: some View {
        ZStack {
            KFImage (movie.thumbnailURL)
                .resizable ()
                .scaledToFill()
                .clipped ( )
            
            VStack {
                Spacer ()
                
                HStack {
                    ForEach(movie.categories, id: \.self) { category in
                        
                        HStack {
                            Text (category)
                                .font(.footnote)
                            
                            if !isCategoryLast( category) {
                                Image (systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                HStack {
                    Spacer()
                    
                    VerticalButton(text: "My List", isOffImage: "plus", isOnImage: "checkmark", isOn: false)
                    
                    Spacer()
                    
                    WhiteButton(text: "Play", imageName: "play.fill")
                        .frame(width: 140)
                    
                    Spacer()
                    
                    VerticalButton(text: "Info", isOffImage: "info.circle", isOnImage: "info.circle", isOn: true)
                    
                    Spacer()
                }
            }
            .background(LinearGradient(colors: [Color.black.opacity(0), Color.black.opacity(0.95)], startPoint: .top, endPoint: .bottom))
        }
        .foregroundColor(.white)
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea(.all)
        
        TopMoviePreview(movie: exampleMovie1)
    }
}
