//
//  StarWarsData.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 1/1/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation

class SWAPI {
    class func requestFilms(from path: Path,  onSuccess: @escaping ([Film])->()) {
        ApiController.getStarWarsData(from: path, for: .film) { films in
            if let films = films as? [Film] {
                onSuccess(films)
            }
        }
    }

    class func requestPeople(from path: Path, onSuccess: @escaping ([People]) -> ()) {
        ApiController.getStarWarsData(from: path, for: .people) { people in
            if let people = people as? [People] {
                onSuccess(people)
            }
        }
    }

    class func requestPlanets(from path: Path, onSuccess: @escaping ([Planet]) -> ())  {
        ApiController.getStarWarsData(from: path, for: .planet) { planets in
            if let planets = planets as? [Planet] {
                onSuccess(planets)
            }
        }
    }

    class func requestVehicles(from path: Path, onSuccess: @escaping ([Vehicle]) -> ())  {
        ApiController.getStarWarsData(from: path, for: .vehicle) { vehicles in
            if let vehicles = vehicles as? [Vehicle] {
                onSuccess(vehicles)
            }
        }
    }

    class func requestStartships(from path: Path, onSuccess: @escaping ([Starship]) -> ())  {
        ApiController.getStarWarsData(from: path, for: .starship) { starships in
            if let starships = starships as? [Starship] {
                onSuccess(starships)
            }
        }
    }

    class func requestSpecies(from path: Path, onSuccess: @escaping ([Species]) -> ())  {
        ApiController.getStarWarsData(from: path, for: .species) { species in
            if let species = species as? [Species] {
                onSuccess(species)
            }
        }
    }
}
