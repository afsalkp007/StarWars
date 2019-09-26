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
    
    func fetchStarWarFilms(Completion: @escaping (StarWar?, Error?) -> ()) {
        
        guard let url = URL(string: filmsUrl) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
                Completion(nil, error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let starWar = try JSONDecoder().decode(StarWar.self, from: data)
                DispatchQueue.main.async {
                    Completion(starWar, nil) 
                }
                
            } catch let jsonErr {
                print(jsonErr.localizedDescription)
                Completion(nil, jsonErr)
            }
            
            
            }.resume()
    }
    
    func fetchMostAppearedCharacterName(_ string: String, completion: @escaping (Character?, Error?) -> ()) {
        
        guard let url = URL(string: string) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil, error)
                return
            }
            
            do {
                guard let data = data else { return }
                let characterJson = try JSONDecoder().decode(Character.self, from: data)
                DispatchQueue.main.async {
                    completion(characterJson, nil)
                }
                
            } catch let jsonErr {
                print(jsonErr.localizedDescription)
                completion(nil, jsonErr)
            }
            }.resume()
    }
    
    func fetchMostAppearedSpeciesName(_ string: String, completion: @escaping (Species?, Error?) -> ()) {
        
        guard let url = URL(string: string) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil, error)
                return
            }
            
            do {
                guard let data = data else { return }
                let speciesJson = try JSONDecoder().decode(Species.self, from: data)
                DispatchQueue.main.async {
                    completion(speciesJson, nil)
                }
                
            } catch let jsonErr {
                print(jsonErr.localizedDescription)
                completion(nil, jsonErr)
            }
            }.resume()
    }
}
