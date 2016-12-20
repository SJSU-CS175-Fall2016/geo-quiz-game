//
//  Locatiob.swift
//  GeoQuiz
//
//  Created by Joan sirma on 12/16/16.
//  Copyright © 2016 Joan sirma. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class Location: NSObject, MKAnnotation{
    
    var title: String?
    var capital: String?
    let coordinate: CLLocationCoordinate2D
    
    
    init(country: String, capital: String, coordinate: CLLocationCoordinate2D) {
        
        self.title = country
        self.capital = capital
        self.coordinate = coordinate
        super.init()
        
    }
    func getCapital()-> String
    {
        return capital!
    }
    
}
