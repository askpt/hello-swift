//
//  DetailView.swift
//  PhotoMeet
//
//  Created by Andre Silva on 03/06/2022.
//

import SwiftUI

struct DetailView: View {
    @State var photo: PhotoDescription

    var body: some View {
        NavigationView {
            VStack {
                AsyncImage(url: photo.imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
            }
            .navigationTitle(photo.description)
        }
    }
}
