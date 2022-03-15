//
//  NetworkManager.swift
//  TV Demo App
//
//  Created by Steve Plavetzky on 3/15/22.
//

import UIKit

class NetworkManager{
    static let shared = NetworkManager()
    private init() {}
    private let cache = NSCache<NSString, UIImage>()

    
    func networkTest() async -> PexelsModel?{
        guard let url = URL(string: "https://api.pexels.com/videos/search?query=nature&per_page=1") else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.setValue("563492ad6f9170000100000102d73f6b34824d948923067e3f035c2e", forHTTPHeaderField: "Authorization")
        
        do{
            print(request)
            let (data, response) = try await URLSession.shared.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                return nil
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let results = try decoder.decode(PexelsModel.self, from: data)
                print(results)
                return results
            } catch {
                print(error)
                return nil
            }
        } catch let someError{
            print(someError)
            return nil
        }
    }
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void ){
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        DispatchQueue.global(qos: .userInitiated).async {
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
                
                guard let data = data, let image = UIImage(data: data) else {
                    completed(nil)
                    return
                }
                
                self.cache.setObject(image, forKey: cacheKey)
                completed(image)
            }
            task.resume()
        }

    }
}
