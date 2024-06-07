//
//  ContentView.swift
//  NewApp
//
//  Created by Nicholas Auerbach on 4/17/24.
//

import SwiftUI

struct Info: Codable{
    var id: Int
    var name: String
    //var points_possible: Int
    var has_submitted_submissions: Bool
    
    func submissionStatus() -> String {
            return has_submitted_submissions ? "Submitted" : "Not Submitted"
        }
    /*func possiblePoints() -> String {
        return " \(points_possible)"
    }*/
}

struct ContentView: View {
    
    @State private var studentName = "Nick"
    @State private var list: [Info] = []
    
    var body: some View {
        Text("Grade Guru")
            .font(.largeTitle)
            .foregroundColor(.red)
        List($list, id: \.id) { $thing in
            VStack(alignment: .leading) {
                Grid{
                    GridRow{
                        Text(thing.name)
                            .font(.headline)
                        Divider()
                        //Text(thing.possiblePoints())
                        Text(thing.submissionStatus())
                    }
                }
            }
        }
        .task {
            await loadData()
        }
    }
    func loadData() async {
        guard let url = URL(string: "https://lms.pps.net/api/v1/courses/116982/assignments/?access_token=8909~Y0fiFEIFu36NIJiiAr0cWXzlMw3Vb91cI0yBeMdGG40qvTXKJsYl6gNjmyIaeBDJ&include[submission]") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([Info].self, from: data) {
                list = decodedResponse
            }
        } catch {
            print("Invalid data")
        }
    }
}


#Preview {
    ContentView()
}
