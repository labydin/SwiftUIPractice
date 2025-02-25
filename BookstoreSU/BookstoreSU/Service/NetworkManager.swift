//
//  NetworkManager.swift
//  BookstoreSU
//
//  Created by 박준영 on 11/27/24.
//

import Foundation

struct NetworkManager {
    
    static var shared = NetworkManager()
    
    
    func loadData(query: String) async -> [Document] {
        var components = URLComponents(string: "https://dapi.kakao.com/v3/search/book")!
        components.queryItems = [URLQueryItem(name: "query", value: query)]
        
        guard let url = components.url else {
            print("Invalid URL")
            return []
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = ["Authorization" : "KakaoAK 510aed2153c26b6173b37707b592b58c"]
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return []
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response code: \(httpResponse.statusCode)")
                return []
            }
            
            if let decodedResponse = try? JSONDecoder().decode(ResponsedBooks.self, from: data) {
                return decodedResponse.documents
            } else {
                print("Failed to decode response")
                return []
            }
        } catch {
            print("Invalid data: \(error.localizedDescription)")
            return []
        }
    }
    
}
