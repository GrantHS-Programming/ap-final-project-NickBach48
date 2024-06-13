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
    let item: Response
    
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
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "://lms.pps.net"
        urlComponents.path = "/api/v1/courses/\(item.myId)/assignments/"
        urlComponents.queryItems = [URLQueryItem(name: "?access_token", value: "8909~Y0fiFEIFu36NIJiiAr0cWXzlMw3Vb91cI0yBeMdGG40qvTXKJsYl6gNjmyIaeBDJ")]
        urlComponents.fragment = "&include[submission]"
        
        /*print("https://lms.pps.net/api/v1/courses/\(item.myId)/assignments/?access_token=8909~Y0fiFEIFu36NIJiiAr0cWXzlMw3Vb91cI0yBeMdGG40qvTXKJsYl6gNjmyIaeBDJ&include[submission]")*/
        
        guard let url = URL(string: "https://lms.pps.net/api/v1/courses/\(item.myId)/assignments/?access_token=8909~Y0fiFEIFu36NIJiiAr0cWXzlMw3Vb91cI0yBeMdGG40qvTXKJsYl6gNjmyIaeBDJ&include[submission]")
                                
            else {
            print("Invalid")
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
    ContentView(item: Response(
        name: "defaultClass",
        course_code: "mandel-123",
        id: 131930,
        enrollment_term_id: 116982,
        default_view: "modules"))
}
