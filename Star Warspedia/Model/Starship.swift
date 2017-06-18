//
//  Starship.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/18/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import Foundation

struct Starship: Codable {
    struct Result: Codable {
        let name: String
        let model: String
        let manufacturer: String
        let costInCredits: String
        let length: String
        let maxAtmospheringSpeed: String
        let crew: String
        let passengers: String
        let cargoCapicity: String
        let consumables: String
        let hyperdriveRating: String
        let MGLT: String
        let starshipClass: String
        let pilots: [String]
        let films: [String]
        let created: String
        let edited: String
        let url: String

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

    let starships: [Result]

    private enum CodingKeys: String, CodingKey {
        case starships = "results"
    }
}
