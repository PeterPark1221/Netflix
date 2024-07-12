//
//  Trailers.swift
//  Netflix
//
//  Created by PeterPark on 1/16/24.
//

import Foundation

struct Trailers: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailImageURL: URL
}
