//
//  TraditionalFood.swift
//  CitytourKiosk
//
//  Created by 박준영 on 11/13/24.
//

import Foundation


struct TraditionalFood: Codable, Hashable {
    var title, description: String
    var restaurant: [String]
    
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case restaurant = "restaurant"
    }
}

typealias Foods = [TraditionalFood]


func loadJSON<T: Decodable>(_ file: String) -> T {
    guard let url = Bundle.main.url(forResource: file, withExtension: "json") else {
        fatalError("Faliled to locate \(file) in bundle")
    }
    
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Failed to decode \(file) from bundle")
    }
}

//참고용
//func decode(_ file: String) -> [Person] {
//    guard let url = Bundle.main.url(forResource: file, withExtension: nil) else {
//        fatalError("Faliled to locate \(file) in bundle")
//    }
//
//    guard let data = try? Data(contentsOf: url) else {
//        fatalError("Failed to load file from \(file) from bundle")
//    }
//
//    let decoder = JSONDecoder()
//
//    guard let loadedFile = try? decoder.decode([Person].self, from: data) else {
//        fatalError("Failed to decode \(file) from bundle")
//    }
//
//    return loadedFile
//}
