//
//  Movie.swift
//  Netflix
//
//  Created by PeterPark on 1/14/24.
//

import Foundation

struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailURL: URL
    
    var categories: [String]
    var genre: HomeGenre = .AllGenre
    
    //movie 서브 헤드라인에 들어갈 정보들
    var year: Int
    var rating: String
    var numberOfSeason: Int?  //옵셔널로 설정한 이유 -> 시즌이 없을수도 있어서
    
    var currentEpisode : CurrentEpisodesInfo?
    
    var defaultEpisodeInfo: CurrentEpisodesInfo
    var creator: String
    var cast: String
    
    var moreLikeThis : [Movie]
    
    var episodes: [Episodes]?
    
    var movieType: movieType {
        return episodes == nil ? .movie : .tvshows
    }
    
    var promotionHeadline: String?
    
    var trailers: [Trailers]
    
    var numberOfSeasonDisplay: String { //if let는 오셔널 타입에만 사용 가능 값을 확인하고 수행하는 뜻
        if let num = numberOfSeason {
            if num == 1 {
                return "1 season"
            }else {
                return "\(num) seasons"
            }
        }
        return ""
    }
    
    var episodeInfoDisplay: String {
        if let current = currentEpisode {
            return "S\(current.season):E\(current.episode) \(current.episodeName)"
        }else {
            return "S\(defaultEpisodeInfo.season):E\(defaultEpisodeInfo.episode) \(defaultEpisodeInfo.episodeName)"
        }
    }
    
    var episodeDescriptionDisplay: String {
        if let current = currentEpisode {
            return current.description
        }else {
            return defaultEpisodeInfo.description
        }
    }
}

struct CurrentEpisodesInfo: Hashable, Equatable {
    var episodeName: String
    var description: String
    var season: Int
    var episode: Int
}


enum movieType {
    case tvshows
    case movie
}
