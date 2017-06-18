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
        return "http://swapi.co/api/films/".url
    }
    static var people: URL{
        return "http://swapi.co/api/people/".url
    }
    static var planets: URL {
        return "http://swapi.co/api/planets/".url
    }
    static var species: URL {
        return "http://swapi.co/api/species/".url
    }
    static var starships: URL {
        return "http://swapi.co/api/starships/".url
    }
    static var vehicles: URL {
        return "http://swapi.co/api/vehicles/".url
    }
}
