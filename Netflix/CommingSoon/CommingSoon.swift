import SwiftUI

struct CommingSoon: View {
    
    @State private var showNotificationList = false
    @State private var movieDetailToShow: Movie? = nil
    @State private var navBarHidden = false
    @State private var scrollOffset: CGFloat = 0.0
    @State private var activeIndex = 0
    
    @ObservedObject var vm = CommingSoonVM()
    
    func updateActiveIndex(fromScroll scroll: CGFloat) {
        if scroll < 105 {
            activeIndex = 0
        } else {
            let remove105 = scroll - 105
            let active = Int(remove105 / 410) + 1
            activeIndex = Int(active)
        }
    }
    
    var body: some View {
        let movies = vm.movies.enumerated().map({ $0 })
        
        let scrollTrackingBinding = Binding {
            return scrollOffset
        } set: { newVal in
            scrollOffset = newVal
            updateActiveIndex(fromScroll: newVal)
        }
        
        Group {
            ZStack {
                Color.black.ignoresSafeArea()
                
                TrackableScrollView(.vertical, showIndicators: false, contentOffset: $scrollOffset) {
                    LazyVStack {
                        NotificationBar(showNotificationList: $showNotificationList)
                        moviesListView(movies: movies)
                    }
                }
                .foregroundColor(.white)
                
                NavigationLink(
                    destination: Text("Notifications List"),
                    isActive: $showNotificationList,
                    label: {
                        EmptyView()
                    })
                .navigationTitle("")
                .navigationBarHidden(navBarHidden)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
                    self.navBarHidden = true
                })
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                    self.navBarHidden = false
                })
            }
        }
    }
    
    private func moviesListView(movies: [(offset: Int, element: Movie)]) -> some View {
        ForEach(Array(movies), id: \.offset) { index, movie in
            CommingSoonRow(movie: movie, movieDetailToShow: $movieDetailToShow, isActive: index == activeIndex)
                .frame(width: 400)
        }
    }
}

struct CommingSoonRow: View {
    let movie: Movie
    @Binding var movieDetailToShow: Movie?
    let isActive: Bool
    
    var body: some View {
        CommingSoon()
            .overlay(
                Group {
                    isActive ? Color.clear : Color.black.opacity(0.8)
                }
                .animation(.easeInOut)
            )
    }
}

#Preview {
    CommingSoon()
}

////
////  CommingSoon.swift
////  Netflix
////
////  Created by PeterPark on 2/29/24.
////
//
//import SwiftUI
//
//struct CommingSoon: View {
//    
//    @State private var showNotificationList = false
//    @State private var MovieSetailToShow: Movie? = nil
//    @State private var navBarHidden = false
//    
//    @State private var scrollOffset: CGFloat = 0.0
//    @State private var activeIndex = 0
//    
//    @ObservedObject var vm = CommingSoonVM()
//    
//    func updateActiveIndex(fromScroll scroll: CGFloat) {
//        if scroll < 105 {
//            activeIndex = 0
//        } else {
//            let remove105 = scroll - 105
//            
//            let active = Int(remove105 / 410) + 1
//            activeIndex = Int(active)
//        }
//    }
//    
//    var body: some View {
//        let movies = vm.movies.enumerated().map({ $0 })
//        
//        let scrollTrackingBinding = Binding {
//            return scrollOffset
//        } set: { newVal in
//            scrollOffset = newVal
//            updateActiveIndex(fromScroll: newVal)
//        }
//        
//        //NavigationView {
//             Group {
//                ZStack {
//                    Color.black.ignoresSafeArea()
//                    
//                    TrackableScrollView(.vertical, showIndicators: false, contentOffset: $scrollOffset) {
//                        LazyVStack {
//                            NotificationBar(showNotificationList: $showNotificationList)
//                            
//                            ForEach(Array(movies), id: \.offset) { index, movie in
//                                    CommingSoon(movie: movie, movieDetailToShow: $MovieSetailToShow)
//                                    .frame(width: 400)
//                                    .overlay (
//                                        Group {
//                                            index == activeIndex ? Color.clear : Color.black.opacity(0.8)
//                                        }
//                                            .animation(.easeInOut)
//                                    )
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    
//                    NavigationLink(
//                        destination: Text("Notifications List"),
//                        isActive: $showNotificationList,
//                        label: {
//                            EmptyView()
//                        })
//                        .navigationTitle("")
//                        .navigationBarHidden(navBarHidden)
//                        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
//                            self.navBarHidden = true
//                        })
//                        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
//                            self.navBarHidden = false
//                        })
//                }
//                
//            }
//        //}
//    }
//}
//
//#Preview {
//    CommingSoon()
//}
