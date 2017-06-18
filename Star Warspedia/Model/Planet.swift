//
//  Planet.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/18/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import Foundation

struct Planet: Codable {
    struct Result: Codable {
        let name: String
        let rotationPeriod: String
        let orbitalPeriod: String
        let diameter: String
        let climate: String
        let gravity: String
        let terrain: String
        let surfaceWater: String
        let population: String
        let residents: [String]
        let films: [String]
        let created: String
        let edited: String
        let url : String

        private enum CodingKeys: String, CodingKey {
            case name
            case rotationPeriod = "rotation_period"
            case orbitalPeriod = "orbital_period"
            case diameter
            case climate
            case gravity
            case terrain
            case surfaceWater = "surface_water"
            case population
            case residents
            case films
            case created
            case edited
            case url
        }
    }
    let planets: [Result]

    private enum CodingKeys: String, CodingKey {
        case planets = "results"
    }
}
