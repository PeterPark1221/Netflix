//
//  ContentView.swift
//  Netflix
//
//  Created by PeterPark on 2/24/24.
//

import SwiftUI

struct ContentView: View {
    
    init () {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
        UITabBar.appearance().backgroundColor = .black
    }
    
    var body: some View {
        TabView {
            
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0)
            
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }.tag(1)
            
            CommingSoon()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Comming soon")
                }.tag(2)
            
            DownloadView()
                .tabItem {
                    Image(systemName: "arrow.down.to.line.alt")
                    Text("Download")
                }.tag(3)
            
            Text("More")
                .tabItem {
                    Image(systemName: "equal")
                    Text("More")
                }.tag(4)
        }
        .accentColor(.white)
    }
}

#Preview {
    ContentView()
}
