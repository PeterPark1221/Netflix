//
//  DownloadView.swift
//  Netflix
//
//  Created by PeterPark on 7/12/24.
//

import SwiftUI

struct DownloadView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            VStack {
                HStack {
                    Image(systemName: "info.circle")
                    Text("Smart Downloads")
                    Text("ON")
                        .foregroundStyle(.blue)
                    
                    Spacer()
                }
                .padding()
                .font(.system(size: 18, weight: .bold))
                
                ZStack {
                    Circle()
                        .foregroundColor(.graySearchBackground)
                        .padding(.horizontal, 100)
                    
                    Image(systemName: "arrow.down.to.line.alt")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 75)
                        .foregroundColor(.gray)
                    
                }
                .frame(height: 275)
                .padding(.top, 75)
                
                VStack {
                    Text("Never be without Netflix")
                        .font(.title2)
                    
                    Text("Download shows and movies so you'll never be without something to watch \n even when you're offline.")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 50)
                    
                    Button(action: {
                        //
                    }, label: {
                        Text("See What You Can Download")
                            .foregroundColor(.black)
                            .padding()
                            .background(.white)
                    })
                }
                
            }
            .foregroundColor(.white)
        }
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        DownloadView()
    }
}
