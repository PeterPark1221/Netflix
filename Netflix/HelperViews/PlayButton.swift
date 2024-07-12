//
//  WhiteButton.swift
//  Netflix
//
//  Created by PeterPark on 1/14/24.
//

import SwiftUI

struct PlayButton: View {
    var text: String
    var imageName: String
    var backgroundColor = Color.white
    
    var body: some View {
        Button(action: {}, label: {
            HStack {
                Spacer()
                
                Image(systemName: imageName)
                    .font(.headline)
                
                Text(text)
                    .bold()
                    .font(.system(size: 16))
                
                Spacer()
            }
        })
        .padding(.vertical, 6)
        .foregroundColor(backgroundColor == .white ? .black : .white)
        .background(backgroundColor)
        .cornerRadius(3.0)
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea(.all)
        
        PlayButton(text: "play", imageName: "play.fill")
    }
}
