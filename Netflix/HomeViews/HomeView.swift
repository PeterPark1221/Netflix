//
//  HomeView.swift
//  Netflix
//
//  Created by PeterPark on 1/14/24.
//

import SwiftUI

struct HomeView: View {
    var vm = HomeVM()
    let screen = UIScreen.main.bounds
    
    @State private var movieDetailToShow: Movie? = nil
    
    @State private var topRowSelection: HomeTopRow = .home
    @State private var homeGenre: HomeGenre = .AllGenre
    
    @State private var showGenreSelection = false
    @State private var showTopRowSelection = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            
            
            //main
            ScrollView(showsIndicators: false) {
                LazyVStack { //vstack를 추가해서 stand-up이랑 trending를 나란히 하기 위해
                    
                    TopRowButtons(topRowSelection: $topRowSelection, homeGenre: $homeGenre, showGenreSelection: $showGenreSelection, showTopRowSelection: $showTopRowSelection)
                    
                    TopMoviePreview(movie: exampleMovie4)
                        .frame(width: screen.width)
                        .padding(.top, -110)
                        .zIndex(-1)
                    
                    HomeStack(vm: vm, topRowSelcted: topRowSelection, selectedGenre: homeGenre, movieDetailToShow: $movieDetailToShow)
                }
            }
            if movieDetailToShow != nil {
                MovieDetail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeInOut)
                    .transition(.opacity)
            }
            if showTopRowSelection {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack(spacing: 40) {
                        
                        Spacer()
                        
                        ForEach(HomeTopRow.allCases, id:\.self) { topRow in
                            Button(action: {
                                topRowSelection = topRow
                                showTopRowSelection = false
                            }, label: {
                                if topRow == topRowSelection {
                                    Text(topRow.rawValue)
                                        .bold()
                                } else {
                                    Text(topRow.rawValue)
                                        .foregroundStyle(.gray)
                                }
                            })
                        }
                        
                        Spacer()
                        
                        Button(action: {
                           showTopRowSelection = false
                        }, label: {
                            Image(systemName: "xmark.circle")
                                .font(.system(size: 40))
                        })
                        .padding(.bottom, 30)
                    }
                        
                }
                .ignoresSafeArea(.all)
                .font(.title2)
            }
            
            if showGenreSelection {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack(spacing: 40) {
                        
                        Spacer()
                        
                        ScrollView {
                            ForEach(vm.allGenre, id:\.self) { genre in
                                Button(action: {
                                    homeGenre = genre
                                    showGenreSelection = false
                                }, label: {
                                    if genre == homeGenre {
                                        Text(genre.rawValue)
                                            .bold()
                                    } else {
                                        Text(genre.rawValue)
                                            .foregroundStyle(.gray)
                                    }
                                })
                                .padding(.bottom, 40)
                            }
                        }
                        Spacer()
                        
                        Button(action: {
                           showGenreSelection = false
                        }, label: {
                            Image(systemName: "xmark.circle")
                                .font(.system(size: 40))
                        })
                        .padding(.bottom, 30)
                    }
                        
                }
                .ignoresSafeArea(.all)
                .font(.title2)
            }
            
        }
        .foregroundColor(.white)
    }
}

#Preview {
    HomeView()
}

struct TopRowButtons: View {
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre: HomeGenre
    
    @Binding var showGenreSelection: Bool
    @Binding var showTopRowSelection: Bool
    
    var body: some View {
        switch topRowSelection {
        case .home:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                        .foregroundColor(.white)
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    topRowSelection = .tvShows
                }, label: {
                    Text("TV Shows")
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    topRowSelection = .movies
                }, label: {
                    Text("Movies")
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    topRowSelection = .myList
                }, label: {
                    Text("My List")
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
        case .tvShows, .movies, .myList:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                        .foregroundColor(.white)
                })
                .buttonStyle(PlainButtonStyle())
                
                HStack(spacing: 20) {
                    Button(action: {
                        showTopRowSelection = true
                    }, label: {
                        HStack {
                            Text(topRowSelection.rawValue)
                                .font(.system(size: 18))
                            
                            Image(systemName: "arrowtriangle.down.fill")
                                .font(.system(size: 10))
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    
                    Button(action: {
                        showGenreSelection = true
                    }, label: {
                        HStack {
                            Text(homeGenre.rawValue)
                                .font(.system(size: 18))
                            
                            Image(systemName: "arrowtriangle.down.fill")
                                .font(.system(size: 10))
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                }
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
        }
    }
}

enum HomeTopRow: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}

enum HomeGenre: String {
    case AllGenre
    case Action
    case Comedy
    case Horror
    case Thriller
    case International
    case Sci_Fi = "Sci-Fi"
    case Science = "Science & Nature"
    case Sports
    case Audio_Description = "Audio Description"
    case Music = "Music & Musicals"
    case Romance
}


