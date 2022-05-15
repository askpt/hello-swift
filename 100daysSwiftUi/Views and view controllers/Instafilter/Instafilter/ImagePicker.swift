//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Andre Silva on 15/05/2022.
//

import PhotosUI
import SwiftUI

struct ImagePicker : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images

        let picker = PHPickerViewController(configuration: config)
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
    }
}
