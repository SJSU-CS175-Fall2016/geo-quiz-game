//
//  Countries.swift
//  GeoQuiz
//
//  Created by Joan sirma on 12/16/16.
//  Copyright © 2016 Joan sirma. All rights reserved.
//
import Foundation
import MapKit
import GameplayKit


class Countries{
    var listOfCountries = [MKAnnotation]()
    var capitalChoicesList = [String]()
    var score: Int
    
    init() {
        score = 0
    }
    func setRandomChoiceList(correctCapital: String)
    {
        let size = listOfCountries.count
        if(size != 0)
        {
            capitalChoicesList.append(correctCapital)
            var index = 0
            while index < 3
            {
                let randomNum:UInt32 = arc4random_uniform(UInt32(size))
                let country = listOfCountries[Int(randomNum)] as! Location
                if(capitalChoicesList.contains(country.capital!))
                {
                    index = index - 1
                }
                else
                {
                    capitalChoicesList.append(country.capital!)
                    index = index + 1
                }
            }
            
            capitalChoicesList = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: capitalChoicesList) as! [String]
            print(capitalChoicesList)
        }
        
    }
    
    func getListOfCountries() -> [MKAnnotation]
    {
        return listOfCountries
    }
    
    func increaseScore()
    {
        score += 1
    }
    
    
}
