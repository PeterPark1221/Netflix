//
//  MovieData.swift
//  Netflix
//
//  Created by PeterPark on 1/14/24.
//

import Foundation
import SwiftUI

let exampleVideoURL = URL(string: "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4")!

let exampleImageURL = URL(string: "https://picsum.photos/300/104")!
let exampleImageURL2 = URL(string: "https://picsum.photos/300/105")!
let exampleImageURL3 = URL(string: "https://picsum.photos/300/106")!

var randomExampleImageURL: URL {
    return [exampleImageURL, exampleImageURL2, exampleImageURL3].randomElement() ?? exampleImageURL
}

let exampletrailer1 = Trailers(name: "Season 3 Trailer", videoURL: exampleVideoURL, thumbnailImageURL: exampleImageURL)

let exampletrailer2 = Trailers(name: "The Hero's journey", videoURL: exampleVideoURL, thumbnailImageURL: exampleImageURL2)

let exampletrailer3 = Trailers(name: "The Mysterious", videoURL: exampleVideoURL, thumbnailImageURL: exampleImageURL3)

let exampleTrailers = [exampletrailer1, exampletrailer2, exampletrailer3]

let episode1 = Episodes(name: "Beginnings and Endings", season: 1, episodeNumber: 1, thumbnailImageURLString: "https://picsum.photos/300/102", description: "Six months after the disappearences, the police form a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event.", length: 53, videoURL: exampleVideoURL)
let episode2 = Episodes(name: "Dark Matter", season: 1, episodeNumber: 2, thumbnailImageURLString: "https://picsum.photos/300/103", description: "Clausen and Charlotte interview Regina. The Stranger takes Hannah to 1987, where Claudia has an unnerving encounter and Egon visits an old nemesis.", length: 54 , videoURL: exampleVideoURL)
let episode3 = Episodes(name: "Ghosts", season: 1, episodeNumber: 3, thumbnailImageURLString: "https://picsum.photos/300/104", description: "In 1954, a missing Helga returns, but he'll only speak to Noah. In 1987, Claudia brings the time machine to Tannhaus, and Egon question Ulrich again.", length: 56, videoURL: exampleVideoURL)
let episode4 = Episodes(name: "Beginnings and Endings", season: 2, episodeNumber: 1, thumbnailImageURLString: "https://picsum.photos/300/107", description: "Six months after the disappearences, the police form a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event.", length: 53, videoURL: exampleVideoURL)
let episode5 = Episodes(name: "Dark Matter", season: 2, episodeNumber: 2, thumbnailImageURLString: "https://picsum.photos/300/106", description: "Clausen and Charlotte interview Regina. The Stranger takes Hannah to 1987, where Claudia has an unnerving encounter and Egon visits an old nemesis.", length: 54 , videoURL: exampleVideoURL)
let episode6 = Episodes(name: "Ghosts", season: 2, episodeNumber: 3, thumbnailImageURLString: "https://picsum.photos/300/105", description: "In 1954, a missing Helga returns, but he'll only speak to Noah. In 1987, Claudia brings the time machine to Tannhaus, and Egon question Ulrich again.", length: 56, videoURL: exampleVideoURL)

var allExampleEpisodes = [episode1, episode2, episode3, episode4, episode5, episode6]
let exampleMovie1 = Movie(
    id: UUID().uuidString,
    name: "Dark",
    thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeason: 2,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creator: "Boran bo Ordan, Jantje Friese",
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel", 
    moreLikeThis: [exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6, exampleMovie7], 
    episodes: allExampleEpisodes,
    trailers: exampleTrailers)
let exampleMovie2 = Movie(
    id: UUID().uuidString,
    name: "Travelers",
    thumbnailURL: URL(string: "https://picsum.photos/200/300/")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020, 
    rating: "TV-MA",
    numberOfSeason: 2,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creator: "Boran bo Ordan, Jantje Friese",
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
    moreLikeThis: [],
    promotionHeadline: "Best Rated Show", 
    trailers: exampleTrailers)
let exampleMovie3 = Movie(
    id: UUID().uuidString,
    name: "Community",
    thumbnailURL: URL(string: "https://picsum.photos/200/301")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020, 
    rating: "TV-MA",
    numberOfSeason: 3,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creator: "Boran bo Ordan, Jantje Friese",
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel", 
    moreLikeThis: [],
    trailers: exampleTrailers)
let exampleMovie4 = Movie(
    id: UUID().uuidString,
    name: "Alone",
    thumbnailURL: URL(string: "https://picsum.photos/200/302")!, 
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020, 
    rating: "TV-MA",
    numberOfSeason: 4,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creator: "Boran bo Ordan, Jantje Friese",
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
    moreLikeThis: [],
    promotionHeadline: "New episodes coming soon", 
    trailers: exampleTrailers)
let exampleMovie5 = Movie(
    id: UUID().uuidString, 
    name: "Hannibal",
    thumbnailURL: URL(string: "https://picsum.photos/200/303")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeason: 5,
    defaultEpisodeInfo: exampleEpisodeInfo1, 
    creator: "Boran bo Ordan, Jantje Friese",
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel", 
    moreLikeThis: [], trailers: exampleTrailers)
let exampleMovie6 = Movie(
    id: UUID().uuidString, 
    name: "After Life",
    thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020, 
    rating: "TV-MA",
    numberOfSeason: 6,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creator: "Boran bo Ordan, Jantje Friese",
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
    moreLikeThis: [],
    promotionHeadline: "Watch Season 6 Now",
    trailers: exampleTrailers)
let exampleMovie7 = Movie(
    id: UUID().uuidString,
    name: "After Life",
    thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeason: 6,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creator: "Boran bo Ordan, Jantje Friese",
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
    moreLikeThis: [],
    promotionHeadline: "Watch Season 6 Now",
    trailers: exampleTrailers)


let exampleMovies: [Movie]  = [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6, exampleMovie7]
 

let exampleEpisodeInfo1 = CurrentEpisodesInfo(episodeName: "Beginnings and Endings", description: "Six months after the disappearences, the police form a task force. In 2052, Jonas learns that most og Winden perished in an apocalyptic event", season: 2, episode: 1)




extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
