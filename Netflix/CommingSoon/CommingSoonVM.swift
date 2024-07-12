//
//  CommingSoonVM.swift
//  Netflix
//
//  Created by PeterPark on 2/29/24.
//

import Foundation

class CommingSoonVM: ObservableObject {
    @Published var movies: [Movie] = []
    
    init(){
        self.movies = generateMovies(20)
    }
}
