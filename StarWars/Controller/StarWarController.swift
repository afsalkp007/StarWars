//
//  StarWarController.swift
//  StarWars
//
//  Created by Afsal's Macbook Pro on 26/09/2019.
//  Copyright © 2019 Afsal. All rights reserved.
//

import UIKit

class StarWarController: UIViewController {
    
    // MARK: - Views
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        createActivityIndicatorView()
    }()
    
    lazy var logoImageView: UIImageView = {
        createLogoImageView()
    }()
    
    lazy var button: UIButton = {
        createButton()
    }()
    
    lazy var longestOpeningCrawlQuestionLabel: UILabel = {
        createLongestOpeningCrawlQuestionLabel()
    }()
    
    lazy var longestOpeningCrawlAnswerLabel: UILabel = {
        createLongestOpeningCrawlAnswerLabel()
    }()
    
    lazy var characterAppearedMostQuestionLabel: UILabel = {
        createCharacterAppearedMostQuestionLabel()
    }()
    
    lazy var characterAppearedMostAnswerLabel: UILabel = {
        createCharacterAppearedMostAnswerLabel()
    }()
    
    lazy var speciesAppearedMostQuestionLabel: UILabel = {
       createSpeciesAppearedMostQuestionLabel()
    }()
    
    lazy var speciesAppearedMostAnswerLabel: UILabel = {
        createSpeciesAppearedMostAnswerLabel()
    }()
    
    lazy var planetProvidedLargestNumberOfVehiclePilotQuestionLabel: UILabel = {
        createLargestNumberOfVehiclePilotQuestionLabel()
    }()
    
    lazy var planetProvidedLargestNumberOfVehiclePilotAnswerLabel: UILabel = {
        createLargestNumberOfVehiclePilotAnswerLabel()
    }()
    
    // MARK: - ViewController LifyCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        createUI()
    }
    
    // MARK: -  Helper Functions
    
    fileprivate func getAnswers() {
        Service.sharedInstance.fetchStarWarFilms { (starWar, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let starWarJson = starWar else { return }
            guard let films = starWarJson.results else { return }
            
            self.getMovieHavingLongestOpeningCrawl(films)
            self.getMostAppearedCharacterInFilms(films)
            self.getMostAppearedSpeciesInFilms(films)
        }
    }
    
    fileprivate func getMovieHavingLongestOpeningCrawl(_ films: [Film]) {
        let openingCrawlArray = films.map{$0.opening_crawl}
        var largestOpeningCrowl = ""
        
        openingCrawlArray.forEach({ (openingCrawl) in
            guard let openingCrawl = openingCrawl else { return }
            if openingCrawl.count > largestOpeningCrowl.count {
                largestOpeningCrowl = openingCrawl
                guard let index = openingCrawlArray.firstIndex(of: largestOpeningCrowl) else { return }
                if let fileName = films[index].title {
                    self.longestOpeningCrawlAnswerLabel.text = fileName
                    self.activityIndicatorView.stopAnimating()
                }
            }
        })
    }
    
    fileprivate func getMostAppearedCharacterInFilms(_ films: [Film]) {
        let characters2DArray = films.compactMap{$0.characters}
        var charactersArray = [String]()
        
        characters2DArray.forEach({ (strArr) in
            strArr.forEach({ (str) in
                charactersArray.append(str)
            })
        })
        var elementCountsDictionary: [String: Int] = [:]
        for item in charactersArray {
            elementCountsDictionary[item] = (elementCountsDictionary[item] ?? 0) + 1
        }
        var arrayHavingMostCharacterCount = [String]()
        elementCountsDictionary.forEach { (key, value) in
            if (value == 2 || value == 3 || value == 4) {
                //print("\(key) occurs \(value) time(s)")
                arrayHavingMostCharacterCount.append(key)
            }
        }
        var res = ""
        arrayHavingMostCharacterCount.forEach { (elementKey) in
            Service.sharedInstance.fetchMostAppearedCharacterName(elementKey) { (character, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let characterJson = character else { return }
                if let characterName = characterJson.name {
                    res += "\(characterName)\n"
                    self.characterAppearedMostAnswerLabel.text = res
                    self.activityIndicatorView.stopAnimating()
                }
            }
        }
    }
    
    fileprivate func getMostAppearedSpeciesInFilms(_ films: [Film]) {
        
        let species2DArray = films.compactMap{$0.species}
        var speciesArray = [String]()
        
        species2DArray.forEach({ (strArr) in
            strArr.forEach({ (str) in
                speciesArray.append(str)
            })
        })
        var elementCountsDictionary: [String: Int] = [:]
        for item in speciesArray {
            elementCountsDictionary[item] = (elementCountsDictionary[item] ?? 0) + 1
        }
        var largeSpeciesCountValue = 0
        for (_, value) in elementCountsDictionary {
            if value > largeSpeciesCountValue {
                largeSpeciesCountValue = value
            }
        }
        var arrayHavingLargeSpeciesCount = [String]()
        elementCountsDictionary.forEach { (key, value) in
            if largeSpeciesCountValue == value {
                arrayHavingLargeSpeciesCount.append(key)
            }
        }
        var res = ""
        arrayHavingLargeSpeciesCount.forEach { (elementKey) in
            
            Service.sharedInstance.fetchMostAppearedSpeciesName(elementKey) { (species, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let speciesJson = species else { return }
                
                if let speciesName = speciesJson.name {
                    res += "\(speciesName) (\(largeSpeciesCountValue))\n"
                    self.speciesAppearedMostAnswerLabel.text = res
                    self.activityIndicatorView.stopAnimating()
                }
            }
        }
    }
    
    // MARK: - Handlers
    
    @objc func handleButtonAction() {
        activityIndicatorView.startAnimating()
        getAnswers()
    }

}

