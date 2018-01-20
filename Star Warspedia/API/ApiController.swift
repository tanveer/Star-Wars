//
//  ApiController.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 12/31/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import Foundation

typealias VoidClosure = () -> ()

enum StarWars {
    case film
    case people
    case starship
    case planet
    case species
    case vehicle
}

class ApiController {
    static func getStarWarsData(from path: Path, for type: StarWars, onSuccess: @escaping ([Any]) -> ()) {
        guard let url = Endpoint.getUrlPath(path) else {
            print(Message.invalidUrl)
            return
        }
        let urlRequst = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        let task = URLSession.shared.dataTask(with: urlRequst) { (data, _ , error) in
            if error == nil {
                if let data = data {
                    do {
                        switch type {
                        case .film:
                            let films = try JSONDecoder().decode(Films.self, from: data).films
                            onSuccess(films)
                        case .people:
                            let poeples = try JSONDecoder().decode(Peoples.self, from: data).poeples
                            onSuccess(poeples)
                        case .planet:
                            let planets = try JSONDecoder().decode(Planets.self, from: data).planets
                            onSuccess(planets)
                        case .starship:
                            let starships = try JSONDecoder().decode(Starships.self, from: data).starships
                            onSuccess(starships)
                        case .species:
                            let species = try JSONDecoder().decode(kSpecies.self, from: data).species
                            onSuccess(species)
                        case .vehicle:
                            let vehicles = try JSONDecoder().decode(Vehicles.self, from: data).vehicles
                            onSuccess(vehicles)
                        }
                    } catch {
                        Message.log(error)
                    }
                }
            } else {
                Message.log(error)
            }
        }
        task.resume()
    }
}
