//
//  GetTester.swift
//  NewApp
//
//  Created by Nicholas Auerbach on 5/15/24.
//

import SwiftUI

struct Response: Codable {
    var id: Int
    var name: String
}


struct GetTester: View {
    @State private var responses = [Response]()
    
    var body: some View {
        Text("Grades")
        List(responses, id: \.id) { item in
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
            }
        }
        .task {
            await loadData()
        }
    }
    func loadData() async {
        guard let url = URL(string: "https://lms.pps.net/api/v1/courses?access_token=8909~Y0fiFEIFu36NIJiiAr0cWXzlMw3Vb91cI0yBeMdGG40qvTXKJsYl6gNjmyIaeBDJ") else {
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
