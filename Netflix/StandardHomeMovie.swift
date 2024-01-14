//
//  StandardHomeMovie.swift
//  Netflix
//
//  Created by PeterPark on 1/14/24.
//

import SwiftUI
import Kingfisher

struct StandardHomeMovie: View {
    var movie: Movie
    
    var body: some View {
        KFImage(movie.thumbnailURL)
            .resizable()
            .scaledToFill()
    }
}

#Preview {
    StandardHomeMovie(movie: exampleMovie1)
}
