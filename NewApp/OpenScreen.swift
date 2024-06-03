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
    @State private var update = Color.red
    @State private var id = 1
    var body: some View {
            NavigationStack{
                /*Text("Grade Guru")
                    .font(.largeTitle)
                    .position(CGPoint(x:UIScreen.main.bounds.width/2, y: 20.0))
                    .foregroundColor(.red)*/
                HStack{
                    Text(current)
                        .font(.system(size:50))
                    Image(.image)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .aspectRatio(contentMode: .fill)
                        //.border(Color.black)
                }
                Circle()
                    .fill(update)
                    .padding(20)
                    .overlay(
                        
                        NavigationLink("Click To Start"){
                            Page4()
                                .navigationBarBackButtonHidden(true)
                        }
                            .foregroundColor(Color.white)
                            .font(.system(size: 25))
                    )
                Button("Change"){
                    withAnimation {
                        current = words.randomElement() ?? "APP"
                        update = colors.randomElement() ?? .red
                        id+=1
                    }
                }
                .buttonStyle(.borderedProminent)
                
            }
            .transition(.slide)
            .id(id)
        }
    }

#Preview {
    OpenScreen()
}
