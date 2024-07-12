//
//  NotificationBar.swift
//  Netflix
//
//  Created by PeterPark on 2/29/24.
//

import SwiftUI

struct NotificationBar: View {
    
    @Binding var showNotificationList: Bool
    
    var body: some View {
        Button(action: {
            showNotificationList = true
        }, label: {
            HStack {
                Image(systemName: "bell")
                
                Text("Notifications")
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .font(.system(size: 18, weight: .bold))
        })
        .foregroundColor(.white)
        .padding()
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea(.all)
        
        NotificationBar(showNotificationList: .constant(false))
    }
}
