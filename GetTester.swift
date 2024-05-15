//
//  GetTester.swift
//  NewApp
//
//  Created by Nicholas Auerbach on 5/15/24.
//

import SwiftUI

struct Response2: Codable {
    var results2: [Result]
}

struct Result2: Codable {
    var trackId2: Int
    var trackName2: String
    var collectionName2: String
}

struct GetTester: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
                    VStack(alignment: .leading) {
                        Text(item.trackName)
                            .font(.headline)
                        Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results}
            
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    GetTester()
}
