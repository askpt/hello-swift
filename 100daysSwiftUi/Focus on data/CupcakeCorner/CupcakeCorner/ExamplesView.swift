//
//  ExamplesView.swift
//  CupcakeCorner
//
//  Created by Andre Silva on 01/05/2022.
//

import SwiftUI

final class User: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case name
    }
    
    @Published var name = "André Silva"
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ExamplesView: View {
    @State private var results = [Result]()
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        // Example 1
        //        List(results, id: \.trackId) { item in
        //            VStack(alignment: .leading) {
        //                Text(item.trackName)
        //                    .font(.headline)
        //                Text(item.collectionName)
        //            }
        //        }
        //        .task {
        //            await loadData()
        //        }
        
        // Example 2
        //        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
        //            image
        //                .resizable()
        //                .scaledToFit()
        //        } placeholder: {
        //            ProgressView()
        //        }
        //        .frame(width: 200, height: 200)
        
        // Example 3
        //        AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
        //            if let image = phase.image {
        //                image.resizable().scaledToFit()
        //            } else if phase.error != nil {
        //                Text("Error loading the image")
        //            } else {
        //                ProgressView()
        //            }
        //        }
        //        .frame(width: 200, height: 200)
        
        // Example 4
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account")
                }
                .disabled(disabledForm)
            }
        }
    }
    
    var disabledForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct ExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        ExamplesView()
    }
}
