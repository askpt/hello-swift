//
//  ContentView.swift
//  PhotoMeet
//
//  Created by Andre Silva on 02/06/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddPhoto = false
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.photos.sorted()) { photo in
                    NavigationLink(destination: DetailView(photo: photo)) {
                        HStack {
                            AsyncImage(url: photo.imageUrl){ image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                            Text(photo.description)
                        }
                    }
                }
            }
            .navigationTitle("PhotoMeet")
            .toolbar {
                Button {
                    showingAddPhoto = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddPhoto)
            {
                AddImageView() { newPhoto in
                    viewModel.update(photo: newPhoto)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
