//
//  OpenScreen.swift
//  NewApp
//
//  Created by Nicholas Auerbach on 4/19/24.
//

import SwiftUI

struct OpenScreen: View {
    
    private var colors: [Color] = [.red, .green, .blue, .purple, .pink, .yellow, .cyan]
    private var words = ["hi", "bye", "APP", "Nick"]
    @State private var current = "APP"
    var body: some View {
        VStack(spacing: 60){
            Text(current)
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
            Button("Click To Start"){
                withAnimation {
                    current = words.randomElement() ?? "APP"
                    //curCol = colors.randomElement() ?? .red
                    
                }
            }
            .buttonStyle(.borderedProminent)
            
        }
        
        
    }
}

#Preview {
    OpenScreen()
}
