//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Andre Silva on 27/06/2022.
//

import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}

struct ContentView: View {
    @State private var searchText = ""
    @State private var sortOrder = ResortSortOrder.defaultOrder
    @StateObject var favourites = Favourites()
    
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    var body: some View {
        NavigationView {
            List(filteredAndOrderedResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        
                        if favourites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favourite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search for a resort")
            .navigationTitle("Resorts")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        Button(action: {
                            sortOrder = .defaultOrder
                        }) {
                            if sortOrder == .defaultOrder {
                                Image(systemName: "checkmark")
                            }
                            Text("Default Order")
                        }
                        
                        Button(action: {
                            if sortOrder == .alphabeticalAscending {
                                sortOrder = .alphabeticalDescending
                            } else {
                                sortOrder = .alphabeticalAscending
                            }
                        }) {
                            if sortOrder == .alphabeticalAscending {
                                Image(systemName: "arrow.up")
                            } else if sortOrder == .alphabeticalDescending {
                                Image(systemName: "arrow.down")
                            }
                            Text("Alphabetical")
                        }
                        
                        Button(action: {
                            if sortOrder == .countryAscending {
                                sortOrder = .countryDescending
                            } else {
                                sortOrder = .countryAscending
                            }
                        }) {
                            if sortOrder == .countryAscending {
                                Image(systemName: "arrow.up")
                            } else if sortOrder == .countryDescending {
                                Image(systemName: "arrow.down")
                            }
                            Text("Country")
                        }
                    }
                label: {
                    Image(systemName: "arrow.up.arrow.down")
                }
                }
            }
            
            WelcomeView()
        }
        .phoneOnlyStackNavigationView()
        .environmentObject(favourites)
    }
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            return resorts
        } else {
            return resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var filteredAndOrderedResorts: [Resort] {
        switch sortOrder {
        case .defaultOrder:
            return filteredResorts
        case .alphabeticalAscending:
            return filteredResorts.sorted {
                $0.name < $1.name
            }
        case .countryAscending:
            return filteredResorts.sorted {
                $0.country < $1.country
            }
        case .alphabeticalDescending:
            return filteredResorts.sorted {
                $0.name > $1.name
            }
        case .countryDescending:
            return filteredResorts.sorted {
                $0.country > $1.country
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
