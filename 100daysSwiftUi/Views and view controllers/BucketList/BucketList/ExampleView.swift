//
//  ExampleView.swift
//  BucketList
//
//  Created by Andre Silva on 23/05/2022.
//

import MapKit
import SwiftUI
import LocalAuthentication

//struct Location: Identifiable {
//    let id = UUID()
//    let name: String
//    let coordinate: CLLocationCoordinate2D
//}

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ExampleView: View {
    let values = [1, 5, 3, 6, 2, 9].sorted()
    
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister"),
    ].sorted()
    
    var loadingState = LoadingState.loading
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
//    let locations = [
//        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
//        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
//    ]
    
    @State private var isUnlocked = false
    
    var body: some View {
        // Example 1
        //        List(values, id: \.self) {
        //            Text(String($0))
        //        }
        
        // Example 2
        //        List(users) { user in
        //            Text("\(user.firstName) \(user.lastName)")
        //        }
        
        // Example 3
        //        Text("Hello world")
        //            .onTapGesture {
        //                let str = "Test message"
        //                let url = getDocumentsDirectory().appendingPathComponent("message.txt")
        //
        //                do {
        //                    try str.write(to: url, atomically: true, encoding: .utf8)
        //
        //                    let input = try String(contentsOf: url)
        //
        //                    print(input)
        //                } catch {
        //                    print(error.localizedDescription)
        //                }
        //            }
        
        // Example 4
        //        if Bool.random() {
        //            Rectangle()
        //        } else {
        //            Circle()
        //        }
        
        // Example 5
        //        if loadingState == .loading {
        //            LoadingView()
        //        } else if loadingState == .success {
        //            SuccessView()
        //        } else if loadingState == .failed {
        //            FailedView()
        //        }
        
        // Example 6
        //        Map(coordinateRegion: $mapRegion)
        
        // Example 7
        //        Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
        //            MapMarker(coordinate: location.coordinate)
        //        }
        
        // Example 8
        //        Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
        //            MapAnnotation(coordinate: location.coordinate) {
        //                VStack{
        //                    Circle()
        //                        .stroke(.red, lineWidth: 3)
        //                        .frame(width: 44, height: 44)
        //
        //                    Text(location.name)
        //                }
        //                .onTapGesture {
        //                    print("Tapped on \(location.name)")
        //                }
        //
        //            }
        //        }
        
        // Example 9
//        NavigationView {
//            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
//                MapAnnotation(coordinate: location.coordinate) {
//                    NavigationLink {
//                        Text(location.name)
//                    } label: {
//                        Circle()
//                            .stroke(.red, lineWidth: 3)
//                            .frame(width: 44, height: 44)
//                    }
//                }
//            }
//            .navigationTitle("London Explorer")
//        }
        
        // Example 10
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    isUnlocked = true
                } else {
                    
                }
            }
        } else {
            
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
    
    //    func example() {
    //        let result = 4 < 5
    //    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
