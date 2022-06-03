//
//  ContentView-ViewModel.swift
//  PhotoMeet
//
//  Created by Andre Silva on 03/06/2022.
//

import Foundation

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var photos : [PhotoDescription]
        
        let savePath = FileManager.documentsDirectory.appendingPathComponent("Photos")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                photos = try JSONDecoder().decode([PhotoDescription].self, from: data)
            } catch {
                photos = []
            }
        }
        
        func update(photo: PhotoDescription) {
            photos.append(photo)
            
            save()
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(photos)
                try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
    }
}
