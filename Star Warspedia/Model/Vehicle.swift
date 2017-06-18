//
//  Vehicle.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/18/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import Foundation

struct Vehicle: Codable  {
    struct Result: Codable {
        let name: String
        let model: String
        let manufacturer: String
        let costInCredits: String
        let length: String
        let maxAtmosperingSpeed: String
        let crew: String
        let passengers: String
        let cargoCapicity: String
        let consumables: String
        let vechileClass: String

        private enum CodingKeys: String, CodingKey {
            case name
            case model
            case manufacturer
            case costInCredits = "cost_in_credits"
            case length
            case maxAtmosperingSpeed =  "max_atmosphering_speed"
            case crew
            case passengers
            case cargoCapicity = "cargo_capacity"
            case consumables
            case vechileClass = "vehicle_class"
        }
    }
    let vehicles: [Result]

    private enum CodingKeys: String, CodingKey {
        case vehicles = "results"
    }
}
