//
//  CustomTabSwitcher.swift
//  Netflix
//
//  Created by PeterPark on 1/16/24.
//

import SwiftUI

struct CustomTabSwitcher: View {
    @State private var currentTab: CustomTab = .episodes
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason : Int
    
    var tabs: [CustomTab]
    var movie: Movie
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(tabs, id:\.self) { tab in
                        VStack {
                            // red bar
                            Rectangle()
                                .frame(height: 6)
                                .foregroundColor(tab == currentTab ? .red : .clear)
                            
                            //tab
                            Button(action: {
                                currentTab = tab
                            }, label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundStyle(tab == currentTab ? .white : .gray)
                                
                            })
                            .frame(height: 30)
                        }
                        
                    }
                }
            }
             
            switch currentTab {
            case .episodes:
                EpisodesView(episodes: movie.episodes ?? [], showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason)
            case .trailer:
                TrailerList(trailers: movie.trailers)
            case .more:
                MoreLikeThis(movies: movie.moreLikeThis)
            }
        }
        .foregroundColor(.white)
    }
}
// 열거형으로 선언
enum CustomTab: String {
    case episodes = "EPISODES"
    case trailer = "TRAILERS & MORE"
    case more = "MORE LIKE ThIS"
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        
        CustomTabSwitcher(showSeasonPicker: .constant(false), selectedSeason: .constant(1), tabs: [.episodes, .trailer, .more], movie: exampleMovie1)
    }
}
