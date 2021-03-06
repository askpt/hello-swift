//
//  ExamplesView.swift
//  Hot Prospects
//
//  Created by Andre Silva on 05/06/2022.
//

import SwiftUI
import UserNotifications
import SamplePackage

@MainActor class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}

@MainActor class DelayedUpdater: ObservableObject {
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct ExamplesView: View {
    @StateObject private var user = User()
    @State private var selectedTab = "One"
    
    @StateObject private var updater = DelayedUpdater()
    
    @State private var output = ""
    @State private var backgroundColor = Color.red
    
    let possibleNumbers = Array(1...60)
    
    var body: some View {
        // Example 1
        //        VStack {
        //            EditView().environmentObject(user)
        //            DisplayView().environmentObject(user)
        //        }
        
        // Example 2
        //        VStack {
        //            EditView()
        //            DisplayView()
        //        }.environmentObject(user)
        
        // Example 3
        //        TabView(selection: $selectedTab) {
        //            Text("Tab 1")
        //                .onTapGesture {
        //                    selectedTab = "Two"
        //                }
        //                .tabItem {
        //                    Label("One", systemImage: "star")
        //                }
        //                .tag("One")
        //
        //            Text("Tab 2")
        //                .tabItem {
        //                    Label("Two", systemImage: "circle")
        //                }
        //                .tag("Two")
        //    }
        
        // Example 4
        //        Text("Value is \(updater.value)")
        
        // Example 5
        //        Text(output)
        //            .task {
        //                await fetchReadings()
        //            }
        
        // Example 6
        //        Image("example")
        //            .interpolation(.none)
        //            .resizable()
        //            .scaledToFit()
        //            .frame(maxHeight: .infinity)
        //            .background(.black)
        //            .ignoresSafeArea()
        
        // Example 7
        //        VStack {
        //            Text("Hello, World!")
        //                .padding()
        //                .background(backgroundColor)
        //
        //            Text("Change Color")
        //                .padding()
        //                .contextMenu {
        //                    Button(role: .destructive) {
        //                        backgroundColor = .red
        //                    } label: {
        //                        Label("Red", systemImage: "checkmark.circle.fill")
        //                    }
        //
        //                    Button("Green") {
        //                        backgroundColor = .green
        //                    }
        //
        //                    Button("Blue") {
        //                        backgroundColor = .blue
        //                    }
        //                }
        //        }
        
        // Example 8
        //        List {
        //            Text("Taylor Swift")
        //                .swipeActions {
        //                    Button {
        //                        print("Hi")
        //                    } label: {
        //                        Label("Send message", systemImage: "message")
        //                    }
        //                }
        //        }
        
        // Example 9
        //        List {
        //            Text("Taylor Swift")
        //                .swipeActions {
        //                    Button(role: .destructive) {
        //                        print("Hi")
        //                    } label: {
        //                        Label("Delete", systemImage: "minus.circle")
        //                    }
        //                }
        //                .swipeActions(edge: .leading) {
        //                    Button {
        //                        print("Hi")
        //                    } label: {
        //                        Label("Pin", systemImage: "pin")
        //                    }
        //                    .tint(.orange)
        //                }
        //        }
        
        // Example 10
        //        VStack {
        //            Button("Request Permission") {
        //                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
        //                    if success {
        //                        print("All set!")
        //                    } else if let error = error {
        //                        print(error.localizedDescription)
        //                    }
        //                }
        //            }
        //
        //            Button("Schedule Notifications") {
        //                let content = UNMutableNotificationContent()
        //                content.title = "Feed the dogs"
        //                content.subtitle = "They look hungry"
        //                content.sound = UNNotificationSound.default
        //
        //                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        //
        //                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        //
        //                UNUserNotificationCenter.current().add(request)
        //            }
        
        // Example 11
        Text(results)
    }
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        
        return strings.joined(separator: ", ")
    }
    
    
    func fetchReadings() async {
        let fetchTask = Task { () -> String in
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        
        let result = await fetchTask.result
        
        //        do {
        //            output = try result.get()
        //        } catch {
        //            print("Download error")
        //        }
        
        switch result {
        case .success(let str):
            output = str
        case .failure(let error):
            output = "Download error: \(error.localizedDescription)"
        }
        
    }
}


struct ExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        ExamplesView()
    }
}
