//
//  HomeVM.swift
//  Netflix
//
//  Created by PeterPark on 1/14/24.
//

import Foundation

import Foundation

class HomeVM: ObservableObject {
     
    //string == category
    @Published var movies: [String: [Movie]] = [:]
    
    public var allCategories: [String] {
        movies.keys.map({ String($0) })
    }
    
    public func getMovie(forcat cat: String) -> [Movie] {
        return movies[cat] ?? []
    }
    
    init() {
        setupMovies()
    }
    
    func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Stand-up Comedy"] = exampleMovies.shuffled()
        movies["New Releases"] = exampleMovies.shuffled()
        movies["Watch It Again"] = exampleMovies.shuffled()
        movies["Stand-up Comedy"] = exampleMovies.shuffled()
        movies["Sci-Fi"] = exampleMovies.shuffled()
        
    }
}
