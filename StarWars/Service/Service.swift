//
//  Service.swift
//  StarWars
//
//  Created by Afsal's Macbook Pro on 26/09/2019.
//  Copyright © 2019 Afsal. All rights reserved.
//

import UIKit

class Service {
    
    static let sharedInstance = Service()
    
    func fetchStarWarFilms(completion: @escaping (Result<StarWar?, Error>) -> ()) {
        
        guard let url = URL(string: filmsUrl) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let starWar = try JSONDecoder().decode(StarWar.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(starWar))
                }
                
            } catch let jsonErr {
                completion(.failure(jsonErr))
            }
            
            
        }.resume()
    }
    
    func fetchMostAppearedCharacterName(_ string: String, completion: @escaping (Result<Character, Error>) -> ()) {
        
        guard let url = URL(string: string) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                guard let data = data else { return }
                let characterJson = try JSONDecoder().decode(Character.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(characterJson))
                }
                
            } catch let jsonErr {
                completion(.failure(jsonErr))
            }
        }.resume()
    }
    
    func fetchMostAppearedSpeciesName(_ string: String, completion: @escaping (Result<Species, Error>) -> ()) {
        
        guard let url = URL(string: string) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                guard let data = data else { return }
                let speciesJson = try JSONDecoder().decode(Species.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(speciesJson))
                }
                
            } catch let jsonErr {
                completion(.failure(jsonErr))
            }
        }.resume()
    }
}
