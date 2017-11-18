//
//  StarWarsData.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 1/1/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation

class SWAPI {

    class func requestFilms(with path: Path,  onSuccess: @escaping ([Film])->()) {
        ApiController.fetchFilms(path) { films in
            onSuccess(films)
        }
    }

    class func requestPeople(with path: Path, onSuccess: @escaping ([People]) -> ()) {
        ApiController.fetchPeople(path) { people in
            onSuccess(people)
        }
    }

    class func requestPlanets(with path: Path, onSuccess: @escaping ([Planet]) -> ())  {
        ApiController.fetchPlanets(path) { planets in
            onSuccess(planets)
        }
    }

    class func requestVehicles(with path: Path, onSuccess: @escaping ([Vehicle]) -> ())  {
        ApiController.fetchVehicles(path){ vehicles in
            onSuccess(vehicles)
        }
    }

    class func requestStartships(with path: Path, onSuccess: @escaping ([Starship]) -> ())  {
        ApiController.fetchStarships(path) { starships in
            onSuccess(starships)
        }
    }

    class func requestSpecies(with path: Path, onSuccess: @escaping ([Species]) -> ())  {
        ApiController.fetchSpecies(path) { species in
            onSuccess(species)
        }
    }
}
