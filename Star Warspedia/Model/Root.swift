//
//  Root.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/17/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import Foundation


struct Root {
    static var films: URL {
        return "https://swapi.co/api/films/".url
    }
    static var people: URL{
        return "https://swapi.co/api/people/".url
    }
    static var planets: URL {
        return "https://swapi.co/api/planets/".url
    }
    static var species: URL {
        return "https://swapi.co/api/species/".url
    }
    static var starships: URL {
        return "https://swapi.co/api/starships/".url
    }
    static var vehicles: URL {
        return "https://swapi.co/api/vehicles/".url
    }
}
