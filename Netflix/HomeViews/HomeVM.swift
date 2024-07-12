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
    
    public var allGenre: [HomeGenre] = [.AllGenre, .Comedy, .Horror, .Thriller, .International, .Music, .Romance, .Science, .Sports, .Sci_Fi, .Audio_Description, .Action]
    
    public func getMovie(forcat cat: String, andHomeRow homeRow: HomeTopRow, andGenre genre: HomeGenre) -> [Movie] {
        
        switch homeRow {
        case .home:
            return movies[cat] ?? []
        case .movies:
            return (movies[cat] ?? []).filter({ ($0.movieType == .movie) && ($0.genre == genre) })
        case .tvShows:
            return (movies[cat] ?? []).filter({ ($0.movieType == .movie) && ($0.genre == genre) })
        case .myList:
            return movies[cat] ?? []
        }
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
