//
//  VerticalButton.swift
//  Netflix
//
//  Created by PeterPark on 1/14/24.
//

import SwiftUI

struct VerticalButton: View {
    var text: String
    
    var isOffImage: String
    var isOnImage: String
    
    var isOn: Bool
    
    var imageName: String {
        if isOn {
            return isOnImage
        } else {
            return isOffImage
        }
    }
    
    var body: some View {
        Button(action: {
            //
        }, label: {
            VStack {
                Image(systemName: imageName)
                    .foregroundColor(.white )
                
                Text(text)
                    .foregroundStyle(.white)
                    .font(.system(size: 14))
                    .bold()
            }
        })
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea(.all)
        
        VerticalButton(text: "My List", isOffImage: "plus", isOnImage: "checkmark", isOn: true)
    }
}
