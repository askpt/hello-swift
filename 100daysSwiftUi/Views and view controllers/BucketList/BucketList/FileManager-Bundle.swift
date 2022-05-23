//
//  FileManager-Bundle.swift
//  BucketList
//
//  Created by Andre Silva on 23/05/2022.
//

import Foundation

extension FileManager {
    func decode<T: Decodable>(_ file: String, key: String) -> T {
        let url = getDocumentsDirectory().appendingPathComponent(key)
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
    
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}