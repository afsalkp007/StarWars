//
//  StarWarController+UI.swift
//  StarWars
//
//  Created by Afsal's Macbook Pro on 26/09/2019.
//  Copyright © 2019 Afsal. All rights reserved.
//

import UIKit

extension StarWarController {
    
    func createActivityIndicatorView() -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.translatesAutoresizingMaskIntoConstraints = false
        return aiv
    }
    
    func createLogoImageView() -> UIImageView {
        let iv = UIImageView(image: #imageLiteral(resourceName: "image"))
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }
    
    func createButton() -> AnimatedButton {
        let button = AnimatedButton()
        button.setImage(#imageLiteral(resourceName: "Group"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.layer.cornerRadius = 15
        button.imageView?.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(handleButtonAction), for: .touchUpInside)
        //button.imageView?.layer.masksToBounds = true
        return button
    }
    
    func createLongestOpeningCrawlQuestionLabel() -> UILabel {
        let label = UILabel()
        label.text = "Wich of all StarWars movies has longest opening crawl?"
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }
    
    func createLongestOpeningCrawlAnswerLabel() -> UILabel {
        let label = UILabel()
        label.text = "-"
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }
    
    func createCharacterAppearedMostQuestionLabel() -> UILabel {
        let label = UILabel()
        label.text = "What character (person) appeared in the most of StarWars films?"
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }
    
    func createCharacterAppearedMostAnswerLabel() -> UILabel {
        let label = UILabel()
        label.text = "_"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }
    
    func createSpeciesAppearedMostQuestionLabel() -> UILabel {
        let label = UILabel()
        label.text = "What species appeared in the most number of StarWars films?"
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }
    
    func createSpeciesAppearedMostAnswerLabel() -> UILabel {
        let label = UILabel()
        label.text = "-"
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }
    
    func createLargestNumberOfVehiclePilotQuestionLabel() -> UILabel {
        let label = UILabel()
        label.text = "What planet in StarWars universe provided largest number of vehicle pilots?"
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }
    
    func createLargestNumberOfVehiclePilotAnswerLabel() -> UILabel {
        let label = UILabel()
        label.text = "Planet: Earch - Pilots: (12) Han Solo - Human, Yoda - Yodi"
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }
    
    func createUI() {
        
        addSubViewsToParentView()
        addScrollAndContainer()
        addOtherUIComponents()
    }
    
    func addSubViewsToParentView() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        containerView.addSubview(logoImageView)
        containerView.addSubview(button)
        containerView.addSubview(longestOpeningCrawlQuestionLabel)
        containerView.addSubview(longestOpeningCrawlAnswerLabel)
        containerView.addSubview(characterAppearedMostQuestionLabel)
        containerView.addSubview(characterAppearedMostAnswerLabel)
        containerView.addSubview(speciesAppearedMostQuestionLabel)
        containerView.addSubview(speciesAppearedMostAnswerLabel)
        containerView.addSubview(planetProvidedLargestNumberOfVehiclePilotQuestionLabel)
        containerView.addSubview(planetProvidedLargestNumberOfVehiclePilotAnswerLabel)
    }
    
    func addScrollAndContainer() {
        scrollView.anchor(left: nil, bottom: view.bottomAnchor, right: nil, top: view.safeAreaLayoutGuide.topAnchor)
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        containerView.anchor(left: nil, bottom: scrollView.bottomAnchor, right: nil, top: scrollView.topAnchor)
        containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    func addOtherUIComponents() {
        logoImageView.anchor(left: nil, bottom: nil, right: nil, top: containerView.safeAreaLayoutGuide.topAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: 150, height: 150))
        logoImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        button.anchor(left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, top: logoImageView.bottomAnchor, padding: .init(top: 10, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 45))
        
        longestOpeningCrawlQuestionLabel.anchor(left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, top: button.bottomAnchor, padding: .init(top: 20, left: 12, bottom: 0, right: 12))
        longestOpeningCrawlQuestionLabel.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        longestOpeningCrawlAnswerLabel.anchor(left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, top: longestOpeningCrawlQuestionLabel.bottomAnchor, padding: .init(top: 8, left: 12, bottom: 0, right: 12))
        longestOpeningCrawlAnswerLabel.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        characterAppearedMostQuestionLabel.anchor(left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, top: longestOpeningCrawlAnswerLabel.bottomAnchor, padding: .init(top: 20, left: 12, bottom: 0, right: 12))
        characterAppearedMostQuestionLabel.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        characterAppearedMostAnswerLabel.anchor(left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, top: characterAppearedMostQuestionLabel.bottomAnchor, padding: .init(top: 8, left: 12, bottom: 0, right: 12))
        //characterAppearedMostAnswerLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        speciesAppearedMostQuestionLabel.anchor(left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, top: characterAppearedMostAnswerLabel.bottomAnchor, padding: .init(top: 20, left: 12, bottom: 0, right: 12))
        speciesAppearedMostQuestionLabel.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        speciesAppearedMostAnswerLabel.anchor(left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, top: speciesAppearedMostQuestionLabel.bottomAnchor, padding: .init(top: 8, left: 12, bottom: 0, right: 12))
        speciesAppearedMostAnswerLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        planetProvidedLargestNumberOfVehiclePilotQuestionLabel.anchor(left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, top: speciesAppearedMostAnswerLabel.bottomAnchor, padding: .init(top: 20, left: 12, bottom: 0, right: 12))
        planetProvidedLargestNumberOfVehiclePilotQuestionLabel.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        planetProvidedLargestNumberOfVehiclePilotAnswerLabel.anchor(left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, top: planetProvidedLargestNumberOfVehiclePilotQuestionLabel.bottomAnchor, padding: .init(top: 8, left: 12, bottom: 8, right: 12))
        planetProvidedLargestNumberOfVehiclePilotAnswerLabel.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
}
