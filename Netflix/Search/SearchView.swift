//
//  SearchView.swift
//  Netflix
//
//  Created by PeterPark on 2/26/24.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var vm = SearchVM()
    
    @State private var searchText = ""
    @State private var movieDetailToShow: Movie? = nil
    
    var body: some View {
        
        let searchTextBinding = Binding {
            return searchText
        } set: {
            searchText = $0
            vm.updateSearchText(with: $0)
        }
        ZStack {
            Color.black.ignoresSafeArea(.all)
            
            VStack {
                SearchBar(text: $searchText, isloading: $vm.isLoading)
                    .padding()
                
                ScrollView {
                    if vm.isShowingPopularMovies {
                        Text("Popular Movies")
                    }
                    
                    if vm.viewState == .empty {
                        Text("Empty")
                    } else if vm.viewState == .ready && !vm.isShowingPopularMovies {
                        Text("Search Result")
                    }
                }
                
                Spacer()
            }
        }
        .foregroundColor(.white)
    }
}

#Preview {
    SearchView()
}
