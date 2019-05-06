//
//  Aviatrix.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

class Aviatrix {
    
    var running = false
    var author = ""
    var location = "St. Louis"
    var distanceTraveled = 0
    var maxFuel = 5000
    var fuelLevel = 5000.0
    var milesPerGallon = 0.4
    var fuelCost = 0.0
    
    init(authorName: String) {
        author = authorName
    }
    
    func start() -> Bool {
        running = true
        return running
    }
    
    func refuel() -> Double {
        let gallonsNeeded = Double(maxFuel) - fuelLevel
        let data = AviatrixData()
        fuelCost += gallonsNeeded * data.fuelPrices[location]!
        
        fuelLevel = 5000.0
        
        return gallonsNeeded
    }
    
    func flyTo(destination : String) {
        distanceTraveled += distanceTo(current: location, target: destination)
        let fuelSpent = Double(distanceTraveled) / milesPerGallon
        fuelLevel -= fuelSpent
        location = destination
        
        
    }
    
    func distanceTo(current: String, target: String) -> Int{
        let data = AviatrixData()
        return data.knownDistances[current]![target]!
    }
    
    func knownDestinations() -> [String] {
       let data = AviatrixData()
       return Array(data.knownDistances.keys)
    }
}
