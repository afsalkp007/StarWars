//
//  Modals.swift
//  StarWars
//
//  Created by Afsal's Macbook Pro on 26/09/2019.
//  Copyright © 2019 Afsal. All rights reserved.
//

import UIKit

struct StarWar: Decodable {
    var count: Int?
    var results: [Film]?
}

struct Film: Decodable{
    var title: String?
    var episode_id: Int?
    var opening_crawl: String?
    var director: String?
    var producer: String?
    var release_date: String?
    var characters: [String]?
    var planets: [String]?
    var starships: [String]?
    var vehicles: [String]?
    var species: [String]?
    var created: String?
    var edited: String?
    var url: String?
}

struct Character: Decodable {
    var name: String?
    var height: String?
    var mass: String?
    var hair_color: String?
    var skin_color: String?
    var eye_color: String?
    var birth_year: String?
    var gender: String?
    var homeworld: String?
    var films: [String]?
    var species: [String]?
    var created: String?
    var edited: String?
    var url: String?
}

struct Species: Decodable {
    var name: String?
    var classification: String?
    var designation: String?
    var average_height: String?
    var skin_colors: String?
    var hair_colors: String?
    var eye_colors: String?
    var average_lifespan: String?
    var language: String?
    var people: [String]?
    var films: [String]?
    var created: String?
    var edited: String?
    var url: String?
}


