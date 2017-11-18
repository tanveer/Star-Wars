//
//  People.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/18/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import Foundation

struct Peoples: Codable {
    let poeples: [People]
    private enum CodingKeys: String, CodingKey {
        case poeples = "results"
    }
}

struct People: Codable {
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let homeWorld: String
    let films: [String]
    let species: [String]
    let vehicles: [String]
    let starships: [String]
    let url: String

    private var speciesId: String {
        return species.last?.replacingOccurrences(of: "/", with: "").replacingOccurrences(of: ":", with: "").replacingOccurrences(of: ".", with: "") ?? ""
    }

    var id: String {
        return String(speciesId[speciesId.range(of: "[0-9]+", options: .regularExpression)!])
    }

    private enum CodingKeys: String, CodingKey {
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case homeWorld = "homeworld"
        case name
        case gender
        case height
        case mass
        case films
        case species
        case vehicles
        case starships
        case url
    }
}
