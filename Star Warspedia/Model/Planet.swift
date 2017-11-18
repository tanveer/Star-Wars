//
//  Planet.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/18/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import Foundation

struct Planets: Codable {
    let planets: [Planet]
    private enum CodingKeys: String, CodingKey {
        case planets = "results"
    }
}

struct Planet: Codable {
    let name: String
    private let rotationPeriod: String
    private let orbitalPeriod: String
    private let planetDiameter: String
    let climate: String
    let gravity: String
    let terrain: String
    private let surfaceWater: String
    private let planetPopulation: String
    let residents: [String]
    let films: [String]
    let created: String
    let edited: String
    let url : String

    var rotation: String? {
        return rotationPeriod == "unknown" ? "unknown"  : rotationPeriod
    }

    var timeInOrbit: String? {
        let orbit = Double(orbitalPeriod.replacingOccurrences(of: "unknown", with: ""))
        return orbit?.daysToYear
    }

    var diameter: String? {
        let diam = planetDiameter.replacingOccurrences(of: "KM", with: "")
        let value = Double(diam)
        return value?.convertedToShortString
    }

    var water: String {
        return surfaceWater == "unknown" ? "0 %" : "\(surfaceWater) %"
    }

    var population: Double? {
        return Double(planetPopulation)
    }

    private enum CodingKeys: String, CodingKey {

        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case planetDiameter = "diameter"
        case climate
        case gravity
        case terrain
        case surfaceWater = "surface_water"
        case planetPopulation = "population"
        case residents
        case films
        case created
        case edited
        case url
    }
}
