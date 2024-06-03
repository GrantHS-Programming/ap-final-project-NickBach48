//
//  Page4.swift
//  NewApp
//
//  Created by Nicholas Auerbach on 5/17/24.
//

import SwiftUI

struct Page4: View {
    
    var body: some View {
        NavigationStack(){
            VStack{
                HStack{
                    Rectangle()
                        .padding(20)
                        .foregroundColor(Color.white)
                        .overlay(
                            NavigationLink("Canvas"){
                                GetTester()
                            }
                                .foregroundColor(.black)
                        )
                    Rectangle()
                        .padding(20)
                        .foregroundColor(.white)
                    
                    
                }
                HStack{
                    Rectangle()
                        .padding(20)
                    Rectangle()
                        .padding(20)
                }
                HStack{
                    Rectangle()
                        .padding(20)
                    Rectangle()
                        .padding(20)
                }
            }
            .background(Color.lightGray)
        }
    }
}
 
#Preview {
    Page4()
}
