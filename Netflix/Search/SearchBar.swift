//
//  SearchBar.swift
//  Netflix
//
//  Created by PeterPark on 2/24/24.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    @State private var isEditing = true
    //입력중인지 확인하는 거
    
    @Binding var isloading: Bool
    //검색했을 때 로딩뜨게 하는 거
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color("gray_search_background")
                .frame(width: 270, height: 36)
                .cornerRadius(8)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color("gray_search_text"))
                    .padding(.leading, 10)
                
                TextField("Search", text: $text)
                    .padding(7)
                    .padding(.leading, -7)
                    .padding(.horizontal, 10)
                    .background(Color("gray_search_background"))
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .onTapGesture(perform: {
                        isEditing = true
                    })
                    .animation(.default)
                
                if !text.isEmpty {
                    if isloading {
                        Button(action: {
                            text = ""
                        }, label: {
                            ActivityIndicator(style: .medium, animate: .constant(true))
                                .configure {
                                    $0.color = .white
                                }
                        })
                        .padding(.trailing, 32)
                        .frame(width: 35, height: 35)
                    } else {
                        Button(action: {
                            text = ""
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(Color("gray_search_text"))
                                .frame(width:35, height: 35)
                        })
                        .padding(.trailing, 18)
                    }
                }
                
                if isEditing {
                    Button(action: {
                        text = ""
                        isEditing = false
                        hideKeyboard()
                    }, label: {
                        Text("Cancel")
                            .foregroundStyle(.white)
                    })
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        SearchBar(text: .constant(""), isloading: .constant(false))
            .padding()
    }
    .foregroundStyle(.white)
}
