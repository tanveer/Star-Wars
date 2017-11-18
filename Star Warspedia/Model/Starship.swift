//
//  Starship.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/18/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import Foundation

struct Starships: Codable {
    let starships: [Starship]
    private enum CodingKeys: String, CodingKey {
        case starships = "results"
    }
}

struct Starship: Codable {
    let name: String
    let model: String
    let manufacturer: String
    private let costInCredits: String
    let length: String
    private let maxAtmospheringSpeed: String
    let crew: String
    let passengers: String
    private let cargoCapicity: String
    let consumables: String
    let hyperdriveRating: String
    let MGLT: String
    let starshipClass: String
    let pilots: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String

    var speed: String {
        let spd = maxAtmospheringSpeed.replacingOccurrences(of: "km", with: "")
        return maxAtmospheringSpeed == "n/a" ? "N/A" : "\(spd) km/h"
    }

    var cost: String? {
        let c = Double(costInCredits)
        return c?.convertedToShortString
    }

    var capacity: String? {
        let cap = Double(cargoCapicity)
        return cap?.convertedToShortString
    }

    private enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case costInCredits = "cost_in_credits"
        case length
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case crew
        case passengers
        case cargoCapicity = "cargo_capacity"
        case consumables
        case hyperdriveRating = "hyperdrive_rating"
        case MGLT
        case starshipClass = "starship_class"
        case pilots
        case films
        case created
        case edited
        case url
    }
}

