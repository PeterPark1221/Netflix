//
//  SwiftUIVideoView.swift
//  Netflix
//
//  Created by PeterPark on 1/16/24.
//

import SwiftUI
import AVKit

struct SwiftUIVideoView: View {
    var url: URL
    
    private var player: AVPlayer {
        AVPlayer(url: url)
    }
    var body: some View {
        VideoPlayer(player: player)
    }
}

#Preview {
    SwiftUIVideoView(url: exampleVideoURL)
}
