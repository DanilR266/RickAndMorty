//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Данила on 21.08.2023.
//

import Foundation

class RequestOrigin {
    
    func request(url: String, completion: @escaping (WelcomeOrigin?) -> Void) {
        print(url)
        let url = URL(string: url)!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do {
                let characterResponse = try JSONDecoder().decode(WelcomeOrigin.self, from: data)
                var origin = characterResponse
                completion(origin)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        task.resume()
    }
    func episodeCount(completion: @escaping (Int?) -> Void) {
        let url = URL(string: "https://rickandmortyapi.com/api/episode")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do {
                let characterResponse = try JSONDecoder().decode(WelcomeEpisode.self, from: data)
                var origin = characterResponse.info.count
                completion(origin)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        task.resume()
    }
    func episode(url: String, completion: @escaping (WelcomeN?) -> Void) {
        let url = URL(string: url)!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do {
                let characterResponse = try JSONDecoder().decode(WelcomeN.self, from: data)
                completion(characterResponse)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        task.resume()
    }
    
}
