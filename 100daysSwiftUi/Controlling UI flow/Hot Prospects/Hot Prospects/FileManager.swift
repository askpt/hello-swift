//
//  FileManager.swift
//  Hot Prospects
//
//  Created by Andre Silva on 12/06/2022.
//

import Foundation

extension FileManager {
    func decode<T: Decodable>(_ file: String, key: String) -> T {
        let url = FileManager.documentsDirectory.appendingPathComponent(key)
        
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
    
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}
