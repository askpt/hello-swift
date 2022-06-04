//
//  AddImageView.swift
//  PhotoMeet
//
//  Created by Andre Silva on 02/06/2022.
//

import SwiftUI

struct AddImageView: View {
    @Environment( \.dismiss) var dismiss
    
    @StateObject private var viewModel: ViewModel
    @State private var showingImagePicker = false
    
    let locationFetcher = LocationFetcher()
    
    init(onSave: @escaping (PhotoDescription) -> Void) {
        _viewModel = StateObject(wrappedValue: ViewModel(onSave: onSave))
        self.locationFetcher.start()
    }
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(.secondary)
                
                Text("Tap to select a picture")
                    .foregroundColor(.white)
                    .font(.headline)
                
                viewModel.image?
                    .resizable()
                    .scaledToFit()
            }
            .onTapGesture {
                showingImagePicker = true
            }
            
            
            TextField("Description", text: $viewModel.description)
                .padding(.vertical)
            
            Button(viewModel.location == nil ? "Read Location" : "Refresh Location") {
                if let location = self.locationFetcher.lastKnownLocation {
                    print("Your location is \(location)")
                    viewModel.location = location
                } else {
                    print("Your location is unknown")
                }
            }
            
            Button("Save") {
                viewModel.save()
                dismiss()
            }
            .disabled(viewModel.image == nil || viewModel.description.isEmpty || viewModel.location == nil)
        }
        .padding()
        .onChange(of: viewModel.inputImage) { _ in viewModel.loadImage() }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $viewModel.inputImage)
        }
    }
}

struct AddImageView_Previews: PreviewProvider {
    static var previews: some View {
        AddImageView() { _ in }
    }
}
