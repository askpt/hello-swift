//
//  AddImageView-ViewModel.swift
//  PhotoMeet
//
//  Created by Andre Silva on 03/06/2022.
//

import Foundation
import SwiftUI

extension AddImageView {
    @MainActor class ViewModel: ObservableObject {
        @Published var image: Image?
        @Published var description = ""
        @Published var inputImage: UIImage?
        var onSave: (PhotoDescription) -> Void
        
        init(onSave: @escaping (PhotoDescription) -> Void) {
            self.onSave = onSave
        }
        
        func loadImage() {
            guard let inputImage = inputImage else {
                return
            }
            
            image = Image(uiImage: inputImage)
        }
        
        func save() {
            guard let inputImage = inputImage else {
                return
            }
            
            let id = UUID()
            let imageUrl = FileManager.documentsDirectory.appendingPathComponent("\(id.uuidString).png")
            let newPhotoDescription = PhotoDescription(id: id, description: description, imageUrl: imageUrl)

            if let jpegData = inputImage.jpegData(compressionQuality: 0.8) {
                do {
                    try jpegData.write(to: imageUrl, options: [.atomic, .completeFileProtection])
                    onSave(newPhotoDescription)
                } catch {
                    print(error.localizedDescription)
                }
                
                
                
            }
        }
    }
}
