//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Shivam Rishi on 9/8/2024.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL =  baseURL + "appetizers"
    
    private init() {}
    
//    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
//        guard let url = URL(string: appetizerURL) else {
//            completed(.failure(.invalidURL))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
//            guard error == nil else {
//                completed(.failure(.unableToComplete))
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completed(.failure(.invalidResponse))
//                return
//            }
//            
//            guard let data = data else {
//                completed(.failure(.invalidData))
//                return
//            }
//            
//            do {
//                let decoder = JSONDecoder()
//                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
//                let appetizers = decodedResponse.request
//                completed(.success(appetizers))
//            } catch {
//                completed(.failure(.invalidData))
//            }
//        }
//        
//        task.resume()
//    }
    
    func getAppetizers() async throws -> [Appetizer] {
        
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)
  
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
            let appetizers = decodedResponse.request
            return appetizers
        } catch {
            throw APError.invalidData
        }
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
       
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
