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
}
