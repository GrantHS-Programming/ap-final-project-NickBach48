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
        Text("Grade Guru")
            .font(.largeTitle)
            .foregroundColor(.red)
        
            NavigationStack{
                NavigationLink("Grades"){
                    GetTester()
                        .navigationBarBackButtonHidden(true)
                }
                .foregroundColor(.white)
                .buttonStyle(.borderedProminent)
                
                
        }
    }
}

#Preview {
    ContentView()
}
