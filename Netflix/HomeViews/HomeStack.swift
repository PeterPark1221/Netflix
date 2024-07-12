//
//  HomeStack.swift
//  Netflix
//
//  Created by PeterPark on 2/21/24.
//

import SwiftUI

struct HomeStack: View {
    var vm: HomeVM
    var topRowSelcted : HomeTopRow
    var selectedGenre: HomeGenre
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        ForEach(vm.allCategories, id: \.self) { category in
            VStack {
                HStack {
                    Text(category)
                        .font(.title3)
                        .bold()
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(vm.getMovie(forcat: category, andHomeRow: topRowSelcted, andGenre: selectedGenre)) { movie in
                            StandardHomeMovie(movie: movie)
                                .frame(width:100, height: 200)
                                .padding(.horizontal, 20)
                                .onTapGesture(perform: {
                                    movieDetailToShow = movie
                                })
                        }
                    }
                }
            }
        }
    }
}

