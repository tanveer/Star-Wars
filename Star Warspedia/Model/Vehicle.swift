//
//  Vehicle.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/18/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import Foundation

struct Vehicles: Codable  {
    let vehicles: [Vehicle]
    private enum CodingKeys: String, CodingKey {
        case vehicles = "results"
    }
}

struct Vehicle: Codable {
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
    let vechileClass: String

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
        case maxAtmospheringSpeed =  "max_atmosphering_speed"
        case crew
        case passengers
        case cargoCapicity = "cargo_capacity"
        case consumables
        case vechileClass = "vehicle_class"
    }
}
