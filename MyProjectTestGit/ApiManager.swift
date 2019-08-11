//
//  ApiManager.swift
//  MyProjectTestGit
//
//  Created by Z64me on 8/8/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import Foundation

class ApiManager{
    func getRandomJoke(completion: @escaping (Joke?) -> Void) {
        guard let url = URL(string: "https://matchilling-tronald-dump-v1.p.rapidapi.com/random/quote") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("9e01ab6b31msh41c0624df19ea38p19baacjsnfec0c43c13d9", forHTTPHeaderField: "x-rapidapi-key")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                print("error")
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    do {
                        let joke = try JSONDecoder().decode(Joke.self, from: data)
                        print(joke)
                        completion(joke)
                    } catch(let error) {
                        print("parse JSON failed")
                        print(error)
                    }
                }
            }
        }
        task.resume()
    }
}
