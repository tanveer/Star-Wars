//
//  Endpoint.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 1/1/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation
class Endpoint {
    private static var people = "https://swapi.co/api/people/"
    private static var planets = "https://swapi.co/api/planets/"
    private static var species = "https://swapi.co/api/species/"
    private static var starships = "https://swapi.co/api/starships/"
    private static var vehicles = "https://swapi.co/api/vehicles/"
    private static var films = "https://swapi.co/api/films/"
    
    class func getUrlPath(_ path: Path) -> URL? {
        switch path {
        case .films:
            return Endpoint.films.url
        case .people(let page):
            return "\(Endpoint.people)?page=\(page)".url
        case .planets(let page):
            return "\(Endpoint.planets)?page=\(page)".url
        case .species(let page):
            return "\(Endpoint.species)?page=\(page)".url
        case .starships(let page):
            return "\(Endpoint.starships)?page=\(page)".url
        case .vehicles(let page):
            return "\(Endpoint.vehicles)?page=\(page)".url
        case .speciesId(_):
            //TODO
            break
        }
        return nil
    }
}
