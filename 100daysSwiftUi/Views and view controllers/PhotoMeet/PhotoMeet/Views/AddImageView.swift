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
    
    init(onSave: @escaping (PhotoDescription) -> Void) {
        _viewModel = StateObject(wrappedValue: ViewModel(onSave: onSave))
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
            
            HStack {
                TextField("Description", text: $viewModel.description)
            }
            .padding(.vertical)
            
            Button("Save") {
                viewModel.save()
                dismiss()
            }
            .disabled(viewModel.image == nil)
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
