//
//  GetTester.swift
//  NewApp
//
//  Created by Nicholas Auerbach on 5/15/24.
//

import SwiftUI

struct Response: Codable {
    var name: String
    var course_code: String
    var id: Int
    var enrollment_term_id: Int
    var default_view: String
    
}
extension Response{
    var myId: String{
        String(id)}
    }


struct GetTester: View {
    @State private var responses = [Response]()
    
    var body: some View {
        NavigationStack{
        NavigationLink("Grade Guru"){
            OpenScreen()
                .navigationBarBackButtonHidden(true)
        }
        .font(.largeTitle)
        .foregroundColor(.red)
            List(responses, id: \.id) { item in
                NavigationLink{
                    ContentView(item: item)
                } label: {
                    VStack(alignment: .leading) {
                        Grid{
                            GridRow{
                                Text(item.name)
                                    .font(.headline)
                                Divider()
                                Text("A+")
                            }
                        }
                    }
                }
               
            }
        }
            .task {
                await loadData()
            }
        }
    func loadData() async {
        guard let url = URL(string: "https://lms.pps.net/api/v1/courses?access_token=8909~Y0fiFEIFu36NIJiiAr0cWXzlMw3Vb91cI0yBeMdGG40qvTXKJsYl6gNjmyIaeBDJ&enrollment_state=active") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([Response].self, from: data) {
                responses = decodedResponse
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    GetTester()
}
