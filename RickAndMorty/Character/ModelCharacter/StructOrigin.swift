//
//  StructOrigin.swift
//  RickAndMorty
//
//  Created by Данила on 22.08.2023.
//

import Foundation

// MARK: - Welcome
struct WelcomeOrigin: Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}


// MARK: - Welcome
struct WelcomeEpisode: Codable {
    let info: InfoEpisode
    let results: [ResultEpisode]
}

// MARK: - Info
struct InfoEpisode: Codable {
    let count, pages: Int
    let next: String
    let prev: JSONNull?
}
struct ResultEpisode: Codable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}

struct WelcomeN: Codable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}


