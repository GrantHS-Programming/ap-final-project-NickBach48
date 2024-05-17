//
//  ContentView.swift
//  NewApp
//
//  Created by Nicholas Auerbach on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var studentName = "Nick"
    
    var body: some View {
        VStack(){
            Text("Grades for " + studentName)
                .font(.title)
                .position(CGPoint(x:UIScreen.main.bounds.width/2, y: 60))
            Grid{
                GridRow{
                   Text("Period 1:")
                    Text("A+")
                }
                GridRow{
                    Text("Period 2:")
                }
                GridRow{
                    Text("Period 3:")
                }
                GridRow{
                    Text("Period 4:")
                }
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}
