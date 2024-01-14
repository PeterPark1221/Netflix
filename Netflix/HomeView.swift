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
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            
            
            //main
            ScrollView(showsIndicators: false) {
                LazyVStack { //vstack를 추가해서 stand-up이랑 trending를 나란히 하기 위해
                    
                    TopMoviePreview(movie: exampleMovie1)
                        .frame(width: screen.width)
                        .padding(.top, -110)
                    
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
                                    ForEach(vm.getMovie(forcat: category)) { movie in
                                        StandardHomeMovie(movie: movie)
                                            .frame(width:100, height: 200)
                                            .padding(.horizontal, 20)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .foregroundColor(.white)
    }
}

#Preview {
    HomeView()
}