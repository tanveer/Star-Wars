//
//  Species.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/18/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import Foundation


struct Species: Codable {
    struct Result: Codable {
        let name: String
        let classification: String
        let designation: String
        let averageHeight: String
        let skinColors: String
        let hairColors: String
        let eyeColors: String
        let averageLifespan: String
        let homeworld: String
        let language: String
        let created: String
        let edited: String
        let url: String
        let people: [String]
        let films: [String]

        private enum CodingKeys: String, CodingKey {
            case name
            case classification
            case designation
            case averageHeight = "average_height"
            case skinColors = "skin_colors"
            case hairColors = "hair_colors"
            case eyeColors = "eye_colors"
            case averageLifespan = "average_lifespan"
            case homeworld
            case language
            case created
            case edited
            case url
            case people
            case films
        }
    }
    let species: [Result]

    private enum CodingKeys: String, CodingKey {
        case species = "results"
    }
}
