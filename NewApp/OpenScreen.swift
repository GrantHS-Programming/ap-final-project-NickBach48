//
//  OpenScreen.swift
//  NewApp
//
//  Created by Nicholas Auerbach on 4/19/24.
//

import SwiftUI

struct OpenScreen: View {
    var body: some View {
        Text("APP")
            .font(.system(size:50))
            
        Circle()
            .fill(Color.red)
            .padding(20)
            .overlay(
                Text("Click To Start")
                    .bold()
                    .font(.system(size:30))
                    .foregroundColor(.white)
            )
        
        
    }
}

#Preview {
    OpenScreen()
}
