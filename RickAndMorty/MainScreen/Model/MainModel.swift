//
//  MainModel.swift
//  RickAndMorty
//
//  Created by Данила on 19.08.2023.
//

import Foundation


class RequestCahracters {
    
    func request(completion: @escaping ([Result?]) -> Void) {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do {
                let characterResponse = try JSONDecoder().decode(Welcome.self, from: data)
                var array = characterResponse.results
                completion(array ?? [])
                for character in characterResponse.results {
                    
                }
                print(array.count)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        task.resume()
    }
}

