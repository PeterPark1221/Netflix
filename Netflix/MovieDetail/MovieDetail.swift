//
//  MovieDetail.swift
//  Netflix
//
//  Created by PeterPark on 1/15/24.
//

import SwiftUI

struct MovieDetail: View {
    var movie: Movie
    
    let screen = UIScreen.main.bounds
    
    @State private var showSeasonPicker = false
    @State private var selectedSeason = 1
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            movieDetailToShow = nil
                        }, label: {
                            Image(systemName: "xmark.circle")
                                .font(.system(size: 28))
                        })
                    }
                    .padding(.horizontal, 22)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            //영화 매인 사진
                            StandardHomeMovie(movie: movie)
                                .frame(width: screen.width / 2.5)
                            
                            //좋아요 버튼, 제작년도, 레이팅, 시즌 수
                            MovieInfoSubHeadline(movie: movie)
                            
                            if movie.promotionHeadline != nil {
                                Text(movie.promotionHeadline!)
                                    .font(.headline)
                                    .bold()
                            }
                            
                            PlayButton(text: "Play", imageName: "play.fill", backgroundColor: .red)
                            
                            //현재 시즌&에피소드 정보, 시즌 대한 설명
                            CurrentEpisodeInformation(movie: movie)
                            
                            //감독 출연자 정보
                            CastInfo(movie: movie)
                            
                            //버튼들
                            HStack(spacing: 60) {
                                VerticalButton(text: "My List", isOffImage: "plus", isOnImage: "checkmark", isOn: true)
                                
                                VerticalButton(text: "Rate", isOffImage: "hand.thumbsup", isOnImage: "hand.thumbsup.fill", isOn: true)
                                
                                VerticalButton(text: "Share", isOffImage: "paperplane", isOnImage: "paperplane", isOn: true)
                                    .font(.system(size: 18))
                                
                                Spacer()
                            }
                            .padding(.leading, 20)
                            
                            CustomTabSwitcher(showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason, tabs: [.episodes, .trailer, .more], movie: movie)
                        }
                        .padding(.horizontal, 10)
                            
                    }
                    
                    Spacer()
                }
                .foregroundColor(.white)
                
                if showSeasonPicker {
                    Group {
                        Color.black.opacity(0.9)
                    
                        VStack(spacing: 40) {
                            Spacer()
                            
                            ForEach(0..<(movie.numberOfSeason ?? 0)) { season in
                                Button(action: {
                                    self.selectedSeason = season + 1
                                    self.showSeasonPicker = false
                                }, label: {
                                    
                                    Text("Season \(season + 1)")
                                        .foregroundStyle(selectedSeason == season + 1 ? .white : .gray)
                                        .bold()
                                        .font(selectedSeason == season + 1 ? .title : .title2)
                                })
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                self.showSeasonPicker = false
                            }, label: {
                                Image(systemName: "x.circle.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 40))
                                    .scaleEffect(x: 1.1)
                            })
                            .padding(.bottom, 30)
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                }
            }
        }
    }
}

#Preview {
    MovieDetail(movie: exampleMovie1, movieDetailToShow: .constant(nil))
}


struct MovieInfoSubHeadline: View {
    var movie: Movie
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            
            Text(String(movie.year))
            
            RatingView(rating: movie.rating)
            
            Text(movie.numberOfSeasonDisplay)
        }
        .foregroundColor(.gray)
        .padding(.vertical, 6)
    }
}

struct RatingView: View {
    var rating: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            
            Text(rating)
                .foregroundStyle(.white)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width: 50, height: 20)
    }
}

struct CastInfo: View {
    var movie: Movie
    
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Text("Cast: \(movie.cast)")
                
                Spacer()
            }
            
            HStack {
                Text("Creator: \(movie.creator)")
                
                Spacer()
            }
        }
        .font(.caption)
        .foregroundColor(.gray)
        .padding(.vertical, 10)
    }
}

struct CurrentEpisodeInformation: View {
    var movie: Movie
    
    var body: some View {
        Group {
            HStack {
                Text(movie.episodeInfoDisplay)
                    .bold()
                
                Spacer()
            }
            .padding(.vertical, 4)
            
            HStack {
                Text(movie.episodeDescriptionDisplay)
                    .font(.subheadline)
                
                Spacer()
            }
        }
    }
}
